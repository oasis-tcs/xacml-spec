# ACAL Core and Hierarchical RBAC Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL Core and Hierarchical Role Based Access Control (RBAC) Profile (`acal-rbac-v1.0.md`, cited here as [RBAC-ACAL]) who knows ACAL but has not necessarily followed the XACML 3.0 RBAC Profile or the analysis that shaped this port.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML 3.0 source it ports
2. Implementers deciding whether, and how, to support RBAC
3. Anyone who wants to understand why this port needed only two changes to ACAL Core (one of which, §8.13, deserves its own look) and no new object types or schemas

This guide is explanatory and informative. It does not replace [RBAC-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core lets a policy test any attribute of a subject. A *role* is just an attribute, so ACAL Core can already express "permit if the subject's `role` attribute contains `manager`" with no profile at all. What RBAC adds is not a new capability — it is a **discipline for organizing policies around roles** so that the properties that make RBAC valuable actually hold:

- each seniority edge lives in exactly one place (the senior role's Permission Policy), so adding a junior edge is a one-line change and never copies a rule;
- a senior role automatically gains every permission of its junior roles;
- a request can ask "does this subject have the privileges of role R?" without naming a resource.

The profile does this with two policy roles — a **Role Policy** and a **Permission Policy** — both of which are ordinary ACAL `PolicyType` objects. There are no new UML classes, no new XSD types, no new JSON Schema definitions. If you are looking for them, you will not find any: this profile is identifiers plus normative prose over constructs ACAL Core already has, the same pattern the ACAL Hierarchical Resource and Multiple Decision Profiles follow.

---

## XACML 3.0 to ACAL: Key Changes

### `<PolicySet>` is gone — and nothing depended on it

XACML 3.0 RBAC is written entirely in terms of two kinds of `<PolicySet>`. ACAL Core merged `<Policy>` and `<PolicySet>` into one recursive `PolicyType`, and merged `<PolicyIdReference>` and `<PolicySetIdReference>` into one `PolicyReference`. So a Role `<PolicySet>` becomes a **Role Policy**, a Permission `<PolicySet>` becomes a **Permission Policy**, and every `<PolicySetIdReference>` becomes a `PolicyReference`.

**What to check as a reviewer:** the XACML 3.0 rule that a Role `<PolicySet>` "SHALL NOT contain any other `<Policy>`, `<PolicySet>`, `<PolicyIdReference>` or `<PolicySetIdReference>`" is written against the four-way element distinction. ACAL has one reference construct. Confirm that the ACAL restatement in [RBAC-ACAL] §5.3.1 constraint 2 ("exactly one `PolicyReference` … and no other `PolicyReference`, no nested `Policy`, and no `Rule`") captures the same intent — it should, because both `<PolicyIdReference>` and `<PolicySetIdReference>` resolve to "evaluate the referenced policy," and RBAC never used the distinction for anything.

### CS02 is the *simplified* RBAC profile

If you remember the XACML 2.0 RBAC profile, or an early XACML 3.0 draft, you may be looking for a Role Assignment `<PolicySet>` and an `enableRole` action. **XACML 3.0 RBAC CS02 (23 October 2014) dropped both.** It also explicitly excludes dynamic role enablement and Separation of Duty (CS02 §1.7). This profile ports CS02, so those are out of scope here for the same reason — see [RBAC-ACAL] §5.2 and the scope box in §4.3. This profile has **no dependency on the ACAL administration and delegation profile**.

### Two changes to ACAL Core — one substantive, one cosmetic

RBAC is the first ACAL profile to lean directly on how the PDP's policy set and policy-reference resolution are specified, and it needed two Core text changes, carried on this branch:

1. **`acal-core-v1.0.md` §8.13 (PolicyReference Evaluation) + §7.8** — §8.13 now specifies how a reference is resolved against the policies that define the PDP: by `PolicyId` and version, within the `BundleType` object's `Policy` set, for any reference in a policy's `CombinerInput`; the entry-point reference must resolve within that set (§7.46), and URL retrieval is a fallback only for non-entry-point references to policies not in the set. §7.8's blanket "the mechanism … is outside the scope of this specification" is narrowed to cover only locating a policy that is *not* among those that define the PDP. **This is a resolution-model change, not a pure editorial tidy** — reviewers should read it against §7.8, §7.46, §8.15, and §7.4's "MAY be resolvable" allowance, and decide whether it belongs in the RBAC PR or as its own Core issue. It changes no evaluation outcome for a well-formed policy set (every reference already had to resolve *somehow*), but it removes latitude an implementation previously had about *where* it resolved from.
2. **`acal-core-v1.0.md` §8.10** now points its phrase "the top level policy" at the definition in §8.15. Cosmetic; RBAC does not actually depend on it.

### The role attribute Target rule is now a constraint on the expression, not the structure

XACML 3.0 RBAC says a Role `<PolicySet>`'s `<Target>` makes it "applicable only to Subjects having the [role]" and "SHALL NOT restrict the Resource, Action, or Environment." The first half is one-directional (applicable *only if* the role is present — it does not forbid additional subject predicates); the second is a structural statement about XACML's `<AnyOf>`/`<AllOf>`/`<Match>` Target. ACAL's `Target` is a single boolean expression, with no category structure. [RBAC-ACAL] §5.3.1 constraint 1 restates both halves: the expression is `true` **only if** the role is present (the one-directional applicability rule — kept one-directional so a multi-role Target, §5.4, or an extra subject predicate stays valid), and it **references only subject-category attributes** (the checkable proxy for "does not restrict R/A/E"). **What to check:** that the constraint is one-directional (an earlier draft had an "if and only if" that would have broken §5.4); that "references only subject-category attributes" is checkable by walking the expression's designator/selector categories after variable expansion; and that it does not forbid a legitimate Role Policy Target.

### Identifier respellings

Per the standard ACAL convention (`acal-core-v1.0.md` §11.2 preamble — new `urn:oasis:names:tc:acal:1.0:` identifier is mandatory to support, the XACML identifier MAY be recognized as a deprecated equivalent):

| Purpose | ACAL | Deprecated (XACML) |
|---|---|---|
| Profile identifier | `urn:oasis:names:tc:acal:1.0:profile:rbac` | `urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical` |
| Role attribute | `urn:oasis:names:tc:acal:1.0:subject:role` | `urn:oasis:names:tc:xacml:2.0:subject:role` |
| HasPrivilegesOfRole action value | `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role` | `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole` |

The role attribute identifier is `O` (optional) in the conformance table because CS02 itself only RECOMMENDS it — a deployment may use other identifiers for roles.

### Combining algorithm: no *specific* one mandated, but two are forbidden

CS02 §5.3 and §6 mandate no combining algorithm; its §2 examples use `permit-overrides` illustratively. [RBAC-ACAL] likewise mandates no specific one — **but** §5.3 forbids `permit-unless-deny` and `deny-unless-permit` on a Role Policy, a Permission Policy, or the entry point, because those return `Permit` when *no* child applies, which in an RBAC construction grants access with no matching permission. This is **new relative to CS02** (which does not address it) and is disclosed in §4.3. **What to check:** that the rule is stated as "the algorithm SHALL return `NotApplicable` when all children do" (a property, not a fixed list), and that the forbidden pair is correctly characterized. §6.1 (non-normative) covers the `permit-overrides` default and the deny-biased case.

---

## The Two-Policy Construction at a Glance

| | Role Policy (RP) | Permission Policy (PP) |
|---|---|---|
| One per | role | role |
| `Target` | the role test, and nothing else — subject-category attributes only | none (or nothing that restricts the subject) |
| `CombinerInput` | exactly one `PolicyReference`, to this role's PP | the role's `Rule`/nested `Policy` permissions; `PolicyReference` to each junior role's PP; optionally a HasPrivilegesOfRole Policy |
| Named as the PDP entry point? | yes (or via a policy that combines only RPs) | **never** |
| Reached by a reference from | the bundle `PolicyReference`, or the entry-point policy | **only** its own RP, or a senior PP (hierarchy) |

The PDP evaluates a `BundleType` object's `PolicyReference` — the entry point ([RBAC-ACAL] §5.3.5). For RBAC that entry point combines the Role Policies; each Role Policy gates access to its Permission Policy by the role test; each Permission Policy carries the permissions and reaches junior roles by reference. A Permission Policy reached any other way would grant its role's permissions to a subject that does not hold the role — which is why "never the entry point, reachable only through its Role Policy" is a normative constraint, not just advice.

**What to check:** [RBAC-ACAL] §5.3.5 **constraint 3** is the graph invariant ("no policy on any path from the entry point references or nests a Permission Policy except that PP's own Role Policy or a senior PP"); §5.3.1 constraint 3 and §5.3.2 constraint 3 are its per-policy halves; §9 lists the mistake as the most serious the profile guards against. An earlier draft of §5.3.5 only forbade the *immediate* bundle reference from naming a PP — confirm the current text closes the whole graph, not just that one edge. It is a fact about which policies are Permission Policies — a deployment-design fact, enforced by the PAP/deployment, not by schema validation.

### Role hierarchy is one `PolicyReference` per edge

A senior role's Permission Policy contains a `PolicyReference` for each role junior to it; because inheritance is transitive, referencing only each *immediately*-junior role's PP is sufficient and RECOMMENDED. Cycles are rejected by ordinary ACAL policy-reference evaluation (`acal-core-v1.0.md` §8.13). Each seniority edge lives in exactly one place — the senior role's PP — so making one role junior to another is a single added `PolicyReference` and touches no rule; removing or moving a role changes the `PolicyReference` objects in its former and new senior roles' PPs (references move, rules do not). **What to check:** [RBAC-ACAL] §5.3.3, and that the worked example in §7.1 shows exactly this (the `manager` PP's single `PolicyReference` to the `employee` PP is the whole hierarchy).

### HasPrivilegesOfRole carries the role as a *resource* attribute

In an ordinary request the role is a subject attribute. In a HasPrivilegesOfRole request the action is `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role` and the role being asked about rides as a **resource** attribute, using the same `AttributeId`. The same `AttributeId` then legitimately appears in both the subject entity and the resource entity of one request — which is well-formed because ACAL's attribute-uniqueness constraint (`acal-core-v1.0.md` §7.33, issue #120) is scoped **per `RequestEntityType`**, i.e. per category. **What to check:** confirm §7.33 actually keys uniqueness on `Sequence{AttributeId, DataType, Issuer}` within one `RequestEntityType` — the §7.33.1 worked example even uses `urn:example:role` as its illustration. If that constraint were global, the HasPrivilegesOfRole request shape would be invalid.

---

## Worked Example

[RBAC-ACAL] §7 runs one hierarchy — `employee`, and `manager` senior to it — end to end, in all three representations (XACML/XML, JACAL/JSON, YACAL/YAML), followed by an access request and a HasPrivilegesOfRole request with their expected decisions. Every construct in it is ACAL Core; the example is carried inside a single `BundleType` object so the whole five-policy set, and its entry point, are visible at once.

**What to check:** the example is non-normative but it is where a subtle error is most likely to hide. Spot-check that (a) each Role Policy's `Target` references only the `access-subject` role attribute, (b) no Permission Policy has a subject-restricting `Target`, (c) the entry point is a `PolicyReference` to `urn:example:rbac:entry-point`, never to a `pp:` policy, and (d) the two request evaluations reach `Permit` for the stated reason.

---

## Published Artifact Set

This profile introduces no new schema files. The complete artifact set for this version is:

- `acal-rbac-v1.0.md` — this profile (normative)
- `acal-rbac-v1.0-reviewer-guide.md` — this guide (informative)

Plus two edits to `acal-core-v1.0.md` (§8.13 + §7.8, and §8.10), carried on the same branch — see "Two changes to ACAL Core" above.

---

## Conformance in One Paragraph

An implementation conforms **as a policy processor** if it evaluates Role Policy / Permission Policy structures as [RBAC-ACAL] §5 and ACAL Core describe, including hierarchy and the reachability graph (§5.3.5); **as an RBAC request generator** if it produces requests carrying role attributes per §5.1 and, where it supports HasPrivilegesOfRole, those requests per §5.3.4. Support for the HasPrivilegesOfRole Policy itself is optional. There is one profile identifier, one recommended role attribute identifier, and one action value — all in [RBAC-ACAL] §10.2 and Annex C.
