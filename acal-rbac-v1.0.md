---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: ACAL v1.0 Core and Hierarchical Role Based Access Control (RBAC) Profile Version 1.0
subtitle: Committee Specification Draft 01
version: "1.0"
stage_revision: csd01 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "RBAC", "role", "policylanguage", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.md


### Previous version


N/A

### Latest version


- https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.html (Authoritative)
- https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.pdf
- https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.md


### Technical Committee

[OASIS eXtensible Access Control Markup Language (XACML) TC](https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=67afe552-0921-49b7-9a85-018dc7d3ef1d)


### Chairs


- Bill Parducci (bill@parducci.net), Individual


### Secretaries


- Bill Parducci (bill@parducci.net), Individual


### Editors


- Steven Legg (steven.legg@viewds.com), [ViewDS Identity Solutions](https://www.viewds.com/)
- Cyril Dangerville (cyril.dangerville@thalesgroup.com), [THALES](https://www.thalesgroup.com/)


### Abstract


This specification is a profile of ACAL that defines how to express core and hierarchical role based access control (RBAC) policies: how a role is carried as a subject attribute, how a Role Policy binds holders of a role to the permissions of that role, how a Permission Policy carries those permissions and inherits from junior roles, and how a request may ask whether a subject has the privileges of a given role.


### Citation Format


When referencing this document, the following citation format should be used:

**[ACAL-RBAC-1.0]**
_%title%_.
Edited by Steven Legg and Cyril Dangerville. %date%. OASIS %subtitle%. https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.html . Latest stage: https://docs.oasis-open.org/xacml/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.html .


### Related Work

This document is related to:

- _Attribute-Centric Authorization Language (ACAL) Version 1.0_.
- _ACAL v1.0 Hierarchical Resource Profile Version 1.0_.


## License, Document Status, and Notices


Copyright © OASIS Open 2026. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

---


## Table of Contents

- [1 Scope](#1-scope)
- [2 Definitions and Acronyms](#2-definitions-and-acronyms)
  - [2.1 Definitions](#21-definitions)
    - [2.1.1 Terms Defined Elsewhere](#211-terms-defined-elsewhere)
    - [2.1.2 Terms Defined in this Document](#212-terms-defined-in-this-document)
    - [2.1.3 Related terms](#213-related-terms)
  - [2.2 Abbreviations and Acronyms](#22-abbreviations-and-acronyms)
- [3 Document Conventions](#3-document-conventions)
  - [3.1 Key Words](#31-key-words)
  - [3.2 Typographical Conventions](#32-typographical-conventions)
- [4 Introduction (non-normative)](#4-introduction-non-normative)
  - [4.1 Background](#41-background)
  - [4.2 The Core and Hierarchical RBAC Model](#42-the-core-and-hierarchical-rbac-model)
  - [4.3 Changes From the Previous Version](#43-changes-from-the-previous-version)
- [5 Profile](#5-profile)
  - [5.1 Roles and Role Attributes](#51-roles-and-role-attributes)
  - [5.2 Role Assignment and Enablement](#52-role-assignment-and-enablement)
  - [5.3 Access Control](#53-access-control)
    - [5.3.1 Role Policy](#531-role-policy)
    - [5.3.2 Permission Policy](#532-permission-policy)
    - [5.3.3 Role Hierarchy](#533-role-hierarchy)
    - [5.3.4 HasPrivilegesOfRole Policy](#534-hasprivilegesofrole-policy)
    - [5.3.5 The PDP Entry Point](#535-the-pdp-entry-point)
  - [5.4 Multi-Role Permissions](#54-multi-role-permissions)
- [6 Policy Authoring Guidance (non-normative)](#6-policy-authoring-guidance-non-normative)
  - [6.1 Combining Algorithms](#61-combining-algorithms)
  - [6.2 Matching Role Attributes in a Target](#62-matching-role-attributes-in-a-target)
  - [6.3 Structuring a Role Hierarchy](#63-structuring-a-role-hierarchy)
- [7 Examples (non-normative)](#7-examples-non-normative)
  - [7.1 Role and Permission Policies](#71-role-and-permission-policies)
  - [7.2 An Access Request](#72-an-access-request)
  - [7.3 A HasPrivilegesOfRole Request](#73-a-hasprivilegesofrole-request)
- [8 Representation Considerations](#8-representation-considerations)
  - [8.1 XML](#81-xml)
  - [8.2 JSON](#82-json)
  - [8.3 YAML](#83-yaml)
- [9 Safety, Security, and Data Protection Considerations](#9-safety-security-and-data-protection-considerations)
- [10 Conformance](#10-conformance)
  - [10.1 Introduction](#101-introduction)
  - [10.2 Conformance Tables](#102-conformance-tables)
    - [10.2.1 Profile Identifier](#1021-profile-identifier)
    - [10.2.2 Attributes](#1022-attributes)
    - [10.2.3 Action Attribute Values](#1023-action-attribute-values)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C ACAL Identifiers](#annex-c-acal-identifiers)
  - [C.1 ACAL Namespaces](#c1-acal-namespaces)
  - [C.2 Profile Identifiers](#c2-profile-identifiers)
  - [C.3 Attributes](#c3-attributes)
  - [C.4 Action Attribute Values](#c4-action-attribute-values)
- [Annex D How to generate HTML and PDF versions](#annex-d-how-to-generate-html-and-pdf-versions)
- [Appendix 1 Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Special Thanks](#special-thanks)
  - [Participants](#participants)
- [Appendix 2 Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)

---


# 1 Scope

This ACAL profile defines how to express core and hierarchical role based access control (RBAC) using ACAL policies. It defines:

- how a role is carried in a request, as a subject attribute ([Section 5.1](#51-roles-and-role-attributes));
- the **Role Policy** and **Permission Policy** constructs, how a Role Policy makes the permissions of a role applicable only to holders of that role, and the structural constraints on each ([Section 5.3](#53-access-control));
- how a role inherits the permissions of one or more junior roles ([Section 5.3.3](#533-role-hierarchy));
- the optional **HasPrivilegesOfRole Policy**, by which a request may ask whether a subject has the privileges associated with a given role ([Section 5.3.4](#534-hasprivilegesofrole-policy));
- how multi-role permissions — permissions that require a subject to hold several roles at once — are expressed ([Section 5.4](#54-multi-role-permissions));
- the identifiers this profile introduces ([Annex C](#annex-c-acal-identifiers)).

RBAC is expressed entirely with ACAL Core constructs: this profile introduces no new object type, and no new schema artifact. It does not define how roles are assigned to, or enabled for, a subject — that is the responsibility of a Role Enablement Authority outside the PDP, and is out of scope ([Section 5.2](#52-role-assignment-and-enablement)). Concrete representations (data formats) for the policy and request/response structures used here are those of the ACAL XML, JSON and YAML representation specifications, unchanged.

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

See Section 2 of [[ACAL-Core-1.0](#acal-core-10)].

### 2.1.2 Terms Defined in this Document

`Role`

: A named collection of permissions. In this profile a role is carried in a request as the value of a subject attribute; see [Section 5.1](#51-roles-and-role-attributes).

`Role Policy`

: A `PolicyType` object whose `Target` makes it applicable only to subjects holding a given role, and whose only content is a reference to the Permission Policy for that role. See [Section 5.3.1](#531-role-policy). Abbreviated **RP**. (Called a Role `<PolicySet>` in [[RBAC](#rbac)].)

`Permission Policy`

: A `PolicyType` object that carries the permissions of a given role — the resources and actions its holders may access — and, for a role that is senior in a hierarchy, references to the Permission Policies of its junior roles. See [Section 5.3.2](#532-permission-policy). Abbreviated **PP**. (Called a Permission `<PolicySet>` in [[RBAC](#rbac)].)

`HasPrivilegesOfRole Policy`

: An optional policy within a Permission Policy that permits a request asking whether a subject has the privileges of the role. See [Section 5.3.4](#534-hasprivilegesofrole-policy).

`Role Enablement Authority`

: An entity, outside the PDP, that assigns roles to subjects and enables roles within a subject's session. Its form is not prescribed by this profile. See [Section 5.2](#52-role-assignment-and-enablement).

`junior role` / `senior role`

: In a role hierarchy, a role B is *junior* to a role A (equivalently, A is *senior* to B) when the holders of A are entitled to every permission of B in addition to their own. See [Section 5.3.3](#533-role-hierarchy).

### 2.1.3 Related terms

None.


## 2.2 Abbreviations and Acronyms

`RBAC`

: Role Based Access Control.

`RP`

: Role Policy.

`PP`

: Permission Policy.

---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [RFC2119] [RFC8174] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions

None.

---


# 4 Introduction (non-normative)


## 4.1 Background

Role based access control lets a policy be written in terms of the roles a subject holds rather than the identity of the subject. A hospital policy can say "an attending physician may read a patient record" once, and every subject who holds the `physician` role gets that access, without the policy naming any of them. When a subject changes jobs, the set of roles enabled for that subject changes, and the permissions follow automatically — the policies do not need to be rewritten. This is the property that makes RBAC scale.

ACAL is attribute-centric, and a role is just an attribute: this profile carries a role as the value of a subject attribute in the request context. What the profile adds is a disciplined way to *organize* policies around roles so that the RBAC properties hold — in particular, so that adding, removing, or re-parenting a role touches only that role's own policies.

The two questions an RBAC policy written to this profile answers are:

1. Given that a subject has roles R₁, R₂, … Rₙ enabled, may that subject perform a given action on a given resource?
2. Given that a subject has roles R₁, R₂, … Rₙ enabled, does that subject have the permissions associated with some role R′? (See [Section 5.3.4](#534-hasprivilegesofrole-policy).)

It does **not** answer "which roles does subject X hold?". That is a question for a Role Enablement Authority, not for the PDP — see [Section 5.2](#52-role-assignment-and-enablement). This profile also does not address dynamic role enablement or Separation of Duty; those are out of scope here exactly as they are in [[RBAC](#rbac)] §1.7.

## 4.2 The Core and Hierarchical RBAC Model

The ANSI/INCITS RBAC model [[ANSI-RBAC](#ansi-rbac)] names five data elements. This profile maps them onto ACAL as follows:

| RBAC element | ACAL |
|---|---|
| User | A subject — a `RequestEntityType` object in a subject category. |
| Role | The value of a subject attribute ([Section 5.1](#51-roles-and-role-attributes)). |
| Object | A resource — a `RequestEntityType` object in the resource category. |
| Operation | An action — carried by the `urn:oasis:names:tc:acal:1.0:action:action-id` attribute. |
| Permission | An (object, operation) pair a role's holders may exercise, expressed as a `RuleType` or nested `PolicyType` object within that role's Permission Policy ([Section 5.3.2](#532-permission-policy)). |

*Hierarchical* RBAC adds inheritance between roles: a senior role's holders receive every permission of its junior roles. This profile implements inheritance by reference — a senior role's Permission Policy contains a `PolicyReference` to each junior role's Permission Policy ([Section 5.3.3](#533-role-hierarchy)). Because inheritance lives in the senior role's own policy, a role can be given a new junior role at any time without editing any other role's policies.

## 4.3 Changes From the Previous Version

This is the first ACAL version of this profile, ported from _XACML v3.0 Core and Hierarchical Role Based Access Control (RBAC) Profile Version 1.0_, **Committee Specification 02, 23 October 2014** [[RBAC](#rbac)]. (Within this document, `[RBAC]` denotes that OASIS profile. ACAL Core's own `[RBAC]` bibliography entry is a different, unrelated reference — the 1992 Ferraiolo/Kuhn conference paper, cited from ACAL Core §4.5 as the academic origin of role based access control — and is not affected by this profile.)

The following substantive changes and decisions apply relative to the XACML 3.0 source:

- **`<PolicySet>` is gone.** ACAL Core merged XACML's `<Policy>` and `<PolicySet>` into a single `PolicyType` object that may contain rules, nested policies, and policy references. Both of [[RBAC](#rbac)]'s policy kinds are `PolicyType` objects in ACAL: a **Role Policy** in place of a Role `<PolicySet>`, a **Permission Policy** in place of a Permission `<PolicySet>`. Every `<PolicySetIdReference>` becomes a `PolicyReference` — ACAL has one reference construct, not a `<PolicyIdReference>`/`<PolicySetIdReference>` pair, and the RBAC constructs never depended on the distinction.
- **No Role Assignment PolicySet, no `enableRole`.** [[RBAC](#rbac)] CS02 already dropped the XACML 2.0 RBAC profile's Role Assignment `<PolicySet>` and `enableRole` action; [Section 5.2](#52-role-assignment-and-enablement) is out of scope here for the same reason it is there. This profile therefore has no dependency on the ACAL administration and delegation profile.
- **Identifier namespace.** All identifiers this profile uses in place of an XACML 3.0 RBAC identifier use the `urn:oasis:names:tc:acal:1.0:` prefix, with the XACML identifier recorded as a deprecated equivalent, per the standard ACAL convention ([Section 10.2](#102-conformance-tables)): the profile identifier `urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical` → `urn:oasis:names:tc:acal:1.0:profile:rbac`; the role attribute `urn:oasis:names:tc:xacml:2.0:subject:role` → `urn:oasis:names:tc:acal:1.0:subject:role`; the HasPrivilegesOfRole action value `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole` → `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`.
- **The role attribute's use stays RECOMMENDED, not required** — a deployment MAY use one or more other attribute identifiers for roles, exactly as [[RBAC](#rbac)] §5.1 allows. See [Section 5.1](#51-roles-and-role-attributes).
- **The "initial policy" constraint is expressed against the ACAL PDP model, and its "reachable only through the Role PolicySet" half is written as a normative rule.** [[RBAC](#rbac)] §5.3 requires that "the PDP can never use a Permission `<PolicySet>` as the PDP's initial policy" and §1.9 adds that a Permission `<PolicySet>` be "reachable only through the corresponding Role `<PolicySet>`". ACAL Core defines the PDP's entry point precisely — the policy named by the `PolicyReference` of the `BundleType` object that defines the PDP ([[ACAL-Core-1.0](#acal-core-10)] Section 8.15). [Section 5.3.5](#535-the-pdp-entry-point) constraint 3, together with [Section 5.3.1](#531-role-policy) constraint 3 and [Section 5.3.2](#532-permission-policy) constraint 3, states both halves as one graph invariant: on every evaluation path from the entry point, a Permission Policy is reached only through its own Role Policy or through the hierarchy.
- **Combining-algorithm safety rule.** [[RBAC](#rbac)] §5.3 and §6 mandate no combining algorithm (the examples in [[RBAC](#rbac)] §2 use permit-overrides for illustration only), and this profile mandates no *specific* one. It does, in [Section 5.3](#53-access-control), forbid at a Role Policy, a Permission Policy, or the entry point any algorithm that produces a decision with no applicable child (`permit-unless-deny`, `deny-unless-permit`) — those would grant access where no permission applies. This is new relative to [[RBAC](#rbac)], which does not address it; it is necessary because ACAL Core's algorithm set includes such algorithms.
- **Role Policy Target restated as an expression constraint.** A Role Policy's `Target` is an ACAL `BooleanExpressionType` — one boolean expression — not XACML's `<AnyOf>`/`<AllOf>`/`<Match>` structure. [[RBAC](#rbac)] §5.3's "applicable only to Subjects having the [role]; the `<Target>` … SHALL NOT restrict the Resource, Action, or Environment" is restated in [Section 5.3.1](#531-role-policy) as: the expression is true only if the role is present, and it references only subject-category attributes. The direction of the applicability rule is preserved (only-if, not iff) so that a Role Policy Target testing several roles at once ([Section 5.4](#54-multi-role-permissions)) or an additional subject predicate remains valid. This matches the ACAL Hierarchical Resource and Multiple Decision Profiles, whose example policies also use the boolean `Apply` form.
- **HasPrivilegesOfRole is a nested `PolicyType`, with the action test on its `Target`.** [[RBAC](#rbac)] §5.3 defines it as a `<Policy>` with a Permit `<Rule>`, and its §2.5 example puts both the action test and the queried-role test in the `<Rule>`'s condition. In ACAL a `RuleType` object has no `Target`, and a bare Permit rule whose condition tested only the queried role would permit every action on every resource carrying that role attribute. [Section 5.3.4](#534-hasprivilegesofrole-policy) therefore requires a nested `PolicyType` object whose `Target` carries the `has-privileges-of-role` action test and whose single Permit `Rule` carries the queried-role test.
- **Two clarifications to ACAL Core** accompany this profile, because RBAC is the first ACAL profile to lean on the PDP's policy-set and reference-resolution model directly:
  - [[ACAL-Core-1.0](#acal-core-10)] Section 8.13 now specifies how a policy reference is resolved against the policies that define the PDP — by `PolicyId` and version, for any reference in a policy's `CombinerInput`; the entry-point reference must resolve within that set ([[ACAL-Core-1.0](#acal-core-10)] Section 7.46). Section 7.8's "outside the scope" sentence is narrowed to cover only locating a policy that is *not* among those that define the PDP (a URL, an external repository). This is a resolution-model clarification, not a change of any evaluation outcome for a well-formed policy set; reviewers should read it against Sections 7.8, 7.46 and 8.15.
  - [[ACAL-Core-1.0](#acal-core-10)] Section 8.10's phrase "the top level policy" now points at its definition in Section 8.15. Non-behavioural.

  See this profile's PR for the exact wording of both.
- **No new schema artifacts.** Like the ACAL Hierarchical Resource and Multiple Decision Profiles, this profile defines identifiers and policy-authoring rules, not new object types; `PolicyType`, `PolicyReferenceType`, `RuleType` and `BundleType` already exist in ACAL Core's XSD, JSON Schema and YAML structure/constraint artifacts.
- **Renames**, consistent with ACAL Core: `<PolicySet>` → `PolicyType` (a *policy*); `<PolicySetIdReference>` → `PolicyReference`; `<Policy>` → nested `PolicyType`; `<Rule>` → `RuleType`; `<AttributeValue>` → `Value`; `<Subjects>`/`<Subject>`/`<SubjectMatch>` → a boolean `Apply` expression.

---


# 5 Profile

This section is normative. It defines the role attribute, and the Role Policy / Permission Policy construction by which an ACAL PDP implements core and hierarchical RBAC.

## 5.1 Roles and Role Attributes

A role SHALL be carried in a request as the value of a subject attribute — a `RequestAttributeType` object within a `RequestEntityType` object whose `Category` is a subject category (for example `urn:oasis:names:tc:acal:1.0:subject-category:access-subject`). A subject MAY hold more than one role at once, carried as multiple values of one role attribute or as values of several role attributes. A role attribute MAY appear in any subject category involved in the request.

Each deployment using this profile SHALL define, or agree upon, the attribute identifier or identifiers it uses for roles. Use of the identifier

`urn:oasis:names:tc:acal:1.0:subject:role`

for every role attribute is RECOMMENDED; where it is used, the corresponding attribute values SHOULD be of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI`. A deployment MAY instead use distinct attribute identifiers for distinct roles (for example `urn:example:attributes:officer-role`), in which case the presence of the attribute, rather than its value, indicates the role.

There is one place where a role is carried other than as a subject attribute: in a request evaluated by a HasPrivilegesOfRole Policy, the role being asked about is carried as a **resource** attribute — see [Section 5.3.4](#534-hasprivilegesofrole-policy).

## 5.2 Role Assignment and Enablement

The assignment of roles to subjects, and the enabling of roles within a subject's session, are outside the scope of the ACAL PDP and of this profile. This profile assumes that a role attribute present in the request context for a given subject is a valid assignment at the time the decision is requested.

One or more entities outside the PDP, here called Role Enablement Authorities, are responsible for those functions. This profile prescribes no form for a Role Enablement Authority: it may be an identity-management service, a session manager, an attribute authority, or any other component, and it MAY itself use ACAL policies to decide which roles a subject may enable. Such policies are not defined by this profile.

## 5.3 Access Control

An ACAL PDP implements RBAC using two kinds of policy: a **Role Policy** and a **Permission Policy**. For each role there SHALL be exactly one Role Policy and exactly one Permission Policy. A permission set that requires several roles held at once is treated, for the purposes of this section, as its own (composite) role with its own Role Policy and Permission Policy — see [Section 5.4](#54-multi-role-permissions).

The `CombiningAlgId` of a Role Policy, of a Permission Policy, and of the entry-point policy ([Section 5.3.5](#535-the-pdp-entry-point)) SHALL identify a combining algorithm that evaluates to `NotApplicable` when every policy and rule it combines evaluates to `NotApplicable` — for example `deny-overrides`, `permit-overrides`, `first-applicable`, or their ordered variants. Algorithms that synthesize a decision in the absence of any applicable child, such as `permit-unless-deny` and `deny-unless-permit`, SHALL NOT be used at these three places: at a Role Policy or the entry point they would grant access to a subject for whom no permission applies; at a Permission Policy they would grant every access the role's rules do not explicitly deny. See [Section 6.1](#61-combining-algorithms).

### 5.3.1 Role Policy

A Role Policy for a role is a `PolicyType` object that:

1. SHALL have a `Target`. The `Target` expression SHALL evaluate to `true` for a request only if the request context contains, in a subject category, the role attribute and value (or, for an identifier-per-role deployment, the role attribute) for this role. The `Target` expression SHALL reference only subject-category attributes — every `AttributeDesignator` or `AttributeSelector` in the expression, including those reached through a `VariableReference`, SHALL name a subject category; it SHALL NOT reference a resource, action or environment attribute. (This is the ACAL form of [[RBAC](#rbac)] §5.3's rule that a Role `<PolicySet>`'s `<Target>` makes it applicable only to the subject and SHALL NOT restrict the Resource, Action, or Environment. ACAL's `Target` is a single boolean expression with no category structure, so the rule is stated as a constraint on the expression's attribute references.)
2. SHALL contain, in its `CombinerInput`, exactly one `PolicyReference` — to the Permission Policy for this role ([Section 5.3.2](#532-permission-policy)) — and no other `PolicyReference`, no nested `Policy`, and no `Rule`.
3. SHALL be the target of a `PolicyReference` only from the `BundleType` object's `PolicyReference` property or from the entry-point policy ([Section 5.3.5](#535-the-pdp-entry-point)). No Permission Policy SHALL reference a Role Policy; role inheritance is expressed only by `PolicyReference` objects between Permission Policies ([Section 5.3.3](#533-role-hierarchy)).

Because a Role Policy's `Target` is the only thing that gates a subject's access to a role's permissions, a `Target` that is stricter than "the role is present" silently withholds permissions rather than causing an error. See [Section 6.2](#62-matching-role-attributes-in-a-target).

### 5.3.2 Permission Policy

A Permission Policy for a role is a `PolicyType` object that:

1. SHALL contain, in its `CombinerInput`, the `Rule` and nested `Policy` objects that describe the resources and actions the holders of this role may access, and MAY contain a HasPrivilegesOfRole Policy ([Section 5.3.4](#534-hasprivilegesofrole-policy)) and `PolicyReference` objects to the Permission Policies of junior roles ([Section 5.3.3](#533-role-hierarchy)).
2. SHALL NOT restrict the subjects to which it applies, in its own `Target` or in the `Target` of any `PolicyType` object it contains or references. (This is the ACAL form of [[RBAC](#rbac)] §5.3's rule that "the `<Target>` of the `<PolicySet>` and its included or referenced `<PolicySet>`, `<Policy>`, and `<Rule>` elements SHALL NOT limit the Subjects" — in ACAL only a `PolicyType` object carries a `Target`.) The `Condition` of a `Rule` MAY reference subject attributes — for example to permit access only to a subject who owns the requested resource. What is forbidden is gating a Permission Policy's *applicability* on the subject: a Permission Policy is made applicable to a subject solely by being referenced from that role's Role Policy, and a subject restriction in the Permission Policy's `Target` would break inheritance, because a senior role's holders — who do not necessarily hold the junior role's attribute — reach the junior Permission Policy by reference.
3. SHALL be reached only through its own Role Policy or through the hierarchy, per [Section 5.3.5](#535-the-pdp-entry-point) constraint 3: it SHALL be the target of a `PolicyReference` only from this role's Role Policy ([Section 5.3.1](#531-role-policy)) or from the Permission Policy of a role senior to it ([Section 5.3.3](#533-role-hierarchy)), SHALL NOT be named by the `PolicyReference` of a `BundleType` object, and SHALL NOT be nested as a `Policy` in any policy. This is what makes a Permission Policy "reachable only through the corresponding Role `<PolicySet>`" ([[RBAC](#rbac)] §1.9) in ACAL terms.

### 5.3.3 Role Hierarchy

A role A is *senior* to a role B when A's holders are entitled to every permission of B. This is expressed by placing, in A's Permission Policy, a `PolicyReference` to B's Permission Policy. A's Permission Policy SHALL include a `PolicyReference` for each role junior to A; because inheritance is transitive through these references, it is sufficient — and RECOMMENDED — for A's Permission Policy to reference only each role *immediately* junior to A, leaving the further juniors to be reached through those roles' own Permission Policies.

Inheritance is resolved by ordinary ACAL policy-reference evaluation ([[ACAL-Core-1.0](#acal-core-10)] Section 8.13), which also detects and rejects any cycle (a cycle in the references would mean two roles were each senior to the other). Making role B junior to role A is a single `PolicyReference` added to A's Permission Policy; the Permission Policies of B and of every other role are unchanged. (Removing a role, or moving it to a different point in the hierarchy, changes the `PolicyReference` objects in the Permission Policies of its former and new senior roles — those references, but no rule content, move.)

### 5.3.4 HasPrivilegesOfRole Policy

A Permission Policy MAY contain a HasPrivilegesOfRole Policy: a nested `PolicyType` object that lets a request ask whether a subject has the privileges of this role, without asking about any particular resource or action of it. ([[RBAC](#rbac)] §5.3 defines it as a `<Policy>` with a Permit `<Rule>`. Because an ACAL `RuleType` object has no `Target`, the action test that a `<Policy>`'s presence in a Permission `<PolicySet>` does not by itself constrain is carried here on the nested `PolicyType` object's `Target`; see [Section 4.3](#43-changes-from-the-previous-version).)

A HasPrivilegesOfRole Policy:

1. SHALL have a `Target` that evaluates to `true` only when the `urn:oasis:names:tc:acal:1.0:action:action-id` attribute has the value `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`, so that the HasPrivilegesOfRole Policy is `NotApplicable` to every ordinary access request.
2. SHALL be answered by a request that carries the role being asked about as a **resource** attribute — a `RequestAttributeType` object in the resource category, using the same role attribute identifier as [Section 5.1](#51-roles-and-role-attributes) but in the resource `RequestEntityType`. (The same `AttributeId` may appear in both a subject entity and the resource entity of one request; ACAL's attribute-uniqueness constraint is scoped per `RequestEntityType` — [[ACAL-Core-1.0](#acal-core-10)] Section 7.33.)
3. SHALL contain a single `Rule` with `Effect` `Permit` whose `Condition` evaluates to `true` for such a request only if the resource role attribute names this Permission Policy's role.

Because a HasPrivilegesOfRole Policy sits inside a Permission Policy, a senior role's holders correctly test as having the privileges of any junior role, through the same inheritance references as ordinary permissions.

### 5.3.5 The PDP Entry Point

An ACAL PDP is defined by a `BundleType` object, and evaluates every request by evaluating the policy named by that object's `PolicyReference` — the entry point ([[ACAL-Core-1.0](#acal-core-10)] Section 8.15). For a PDP implementing this profile:

1. The `BundleType` object's `Policy` property SHALL contain every Role Policy and every Permission Policy, each with a distinct `PolicyId`.
2. The `BundleType` object's `PolicyReference` SHALL NOT name a Permission Policy.
3. On every evaluation path from the entry point, no policy SHALL reference a Permission Policy, or nest it as a `Policy`, except: (a) that Permission Policy's own Role Policy ([Section 5.3.1](#531-role-policy) constraint 2), and (b) the Permission Policy of a role senior to it ([Section 5.3.3](#533-role-hierarchy)). Equivalently: the only way to reach a Permission Policy is through its Role Policy or through the hierarchy.

The common concrete shape is an **entry-point policy** — a `PolicyType` object whose `CombinerInput` is exactly the Role Policies of the roles the PDP is to consider (each nested or referenced) — named directly by the `BundleType` object's `PolicyReference`. A deployment MAY instead name a single Role Policy (a PDP that considers one role), or a policy that combines an entry-point policy with other policies that themselves reference no Permission Policy (for example a global prohibition, see [Section 6.1](#61-combining-algorithms)); constraint 3 is what all of these have in common.

Constraints 2 and 3 are the ACAL form of [[RBAC](#rbac)] §5.3's "the PDP can never use a Permission `<PolicySet>` as the PDP's initial policy" and §1.9's "reachable only through the corresponding Role `<PolicySet>`". A Permission Policy reached other than through its Role Policy would grant that role's permissions to a subject that does not hold the role.

## 5.4 Multi-Role Permissions

A permission set that a subject may exercise only while holding several roles *simultaneously* is treated as a single *composite role* with its own Role Policy and Permission Policy ([Section 5.3](#53-access-control)). The composite role's Role Policy has a `Target` that evaluates to `true` only when the request context contains all of the required role attributes and values — for example a boolean `and` of one role test per required role, still referencing only subject-category attributes ([Section 5.3.1](#531-role-policy)).

The composite role's Permission Policy MAY reference the Permission Policies of junior roles for inheritance, exactly as in [Section 5.3.3](#533-role-hierarchy). It SHALL NOT be the target of a `PolicyReference` from any other Permission Policy: a senior role that could reach the composite role's permissions by inheritance would obtain them without its holders necessarily holding every required role, defeating the simultaneous-role requirement.

---


# 6 Policy Authoring Guidance (non-normative)

## 6.1 Combining Algorithms

This profile mandates no *specific* combining algorithm, but [Section 5.3](#53-access-control) does rule out, at a Role Policy, a Permission Policy, and the entry point, any algorithm that can produce a decision when none of its children apply (`permit-unless-deny`, `deny-unless-permit`) — with a single `NotApplicable` child such an algorithm would still yield `Permit`, granting access where no permission matched. Within those bounds, `urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides` is the natural choice at three places:

- **within a Permission Policy**, so that a subject is permitted an access if *any* rule, nested policy, or inherited junior Permission Policy permits it;
- **within a Role Policy** — with a single `PolicyReference` child and a permission-preserving algorithm the Role Policy's value is just that of its one child, so `permit-overrides` and `deny-overrides` behave identically here; the point of the [Section 5.3](#53-access-control) rule is to keep an author from choosing one of the two that do not;
- **at the entry point** ([Section 5.3.5](#535-the-pdp-entry-point)), so that a subject holding several roles receives the union of their permissions.

A deployment that needs a `Deny` to override a `Permit` from any role — for example a prohibition that must hold regardless of which roles a subject has — SHOULD name, as the `BundleType` object's `PolicyReference`, a policy that combines the entry-point policy and a separate prohibition policy under a deny-biased algorithm (`deny-overrides`, or `ordered-deny-overrides` where order matters). The prohibition policy references no Permission Policy, so [Section 5.3.5](#535-the-pdp-entry-point) constraint 3 still holds. Do not instead place the prohibition as a `Deny` rule inside a Permission Policy: it would be inherited by every senior role, which a prohibition rarely intends.

## 6.2 Matching Role Attributes in a Target

A Role Policy's `Target` ([Section 5.3.1](#531-role-policy)) typically tests a role carried as an `anyURI` value with `urn:oasis:names:tc:acal:1.0:function:anyURI-is-in`: the role value as the first argument, an `AttributeDesignator` for the role attribute as the second. For an identifier-per-role deployment, a bag-non-empty test on the role attribute's designator is used instead.

Keep the `Target` expression to exactly the role test. Anything more — a resource check, an action check, a time-of-day check — belongs in the Permission Policy's rules, not the Role Policy's `Target`: a `Target` that fails to match withholds *all* of the role's permissions silently, whereas a rule that fails to match simply does not grant that one permission.

## 6.3 Structuring a Role Hierarchy

Give each role its own Role Policy and Permission Policy, and express seniority only as `PolicyReference` objects from the senior Permission Policy to each immediately-junior Permission Policy. Do not flatten a hierarchy by copying a junior role's rules into a senior role's Permission Policy — the copy has to be maintained in two places, and the point of the by-reference structure is that each seniority edge lives in exactly one place (the senior role's Permission Policy), so making one role junior to another is a single added `PolicyReference` and never touches a rule.

---


# 7 Examples (non-normative)

This section works one small hierarchy end to end: an `employee` role and a `manager` role, with `manager` senior to `employee`. An employee may `read` a timesheet; a manager may additionally `read` and `approve` expense reports, and — by inheritance — do anything an employee may do. The `employee` Permission Policy also carries a HasPrivilegesOfRole Policy. (A real deployment would narrow "read a timesheet" to the subject's *own* timesheet with a `Condition` comparing a subject attribute to a resource attribute — permitted by [Section 5.3.2](#532-permission-policy) constraint 2, which forbids subject gating only in a Permission Policy's `Target`, not in a `Rule`'s `Condition` — but that is elided here to keep the example focused on the RBAC structure.)

Role attribute values are `urn:example:roles:employee` and `urn:example:roles:manager`. Identifiers are shown in full; a real deployment would use a short identifier set ([[ACAL-Core-1.0](#acal-core-10)] Section 7.2) to abbreviate them.

## 7.1 Role and Permission Policies

Five policies: an entry-point policy combining the two Role Policies; a Role Policy and a Permission Policy for each role. The entry point is the policy a `BundleType` object's `PolicyReference` names ([Section 5.3.5](#535-the-pdp-entry-point)); all five appear in that object's `Policy` property.

**XACML v4.0 (XML)**

```xml
<Bundle xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <Policy PolicyId="urn:example:rbac:entry-point" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>RBAC entry point: combine the Role Policies.</Description>
        <PolicyReference Id="urn:example:rbac:rp:manager"/>
        <PolicyReference Id="urn:example:rbac:rp:employee"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:rp:manager" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Role Policy: manager.</Description>
        <Target>
            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:manager</Value>
                <AttributeDesignator
                    Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                    AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                    DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
            </Apply>
        </Target>
        <PolicyReference Id="urn:example:rbac:pp:manager"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:rp:employee" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Role Policy: employee.</Description>
        <Target>
            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:employee</Value>
                <AttributeDesignator
                    Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                    AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                    DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
            </Apply>
        </Target>
        <PolicyReference Id="urn:example:rbac:pp:employee"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:pp:manager" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Permission Policy: manager. Inherits employee.</Description>
        <Rule Id="manager-expense-report" Effect="Permit">
            <Description>A manager may read and approve expense reports.</Description>
            <Condition>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:resources:expense-report</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                    </Apply>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:or">
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">read</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                        </Apply>
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">approve</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                        </Apply>
                    </Apply>
                </Apply>
            </Condition>
        </Rule>
        <PolicyReference Id="urn:example:rbac:pp:employee"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:pp:employee" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Permission Policy: employee.</Description>
        <Rule Id="employee-timesheet" Effect="Permit">
            <Description>An employee may read a timesheet.</Description>
            <Condition>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:resources:timesheet</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                    </Apply>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">read</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                            AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                    </Apply>
                </Apply>
            </Condition>
        </Rule>
        <Policy PolicyId="urn:example:rbac:pp:employee:has-privileges" Version="1.0"
                CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
            <Description>HasPrivilegesOfRole: employee.</Description>
            <Target>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                    <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
                    <AttributeDesignator
                        Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                        DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                </Apply>
            </Target>
            <Rule Id="has-privileges-of-employee" Effect="Permit">
                <Condition>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:employee</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                    </Apply>
                </Condition>
            </Rule>
        </Policy>
    </Policy>

    <PolicyReference Id="urn:example:rbac:entry-point"/>
</Bundle>
```

**JACAL v1.0 (JSON)**

```json
{
    "Bundle": {
        "PolicyReference": { "Id": "urn:example:rbac:entry-point" },
        "Policy": [
            {
                "PolicyId": "urn:example:rbac:entry-point",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "RBAC entry point: combine the Role Policies.",
                "CombinerInput": [
                    { "PolicyReference": { "Id": "urn:example:rbac:rp:manager" } },
                    { "PolicyReference": { "Id": "urn:example:rbac:rp:employee" } }
                ]
            },
            {
                "PolicyId": "urn:example:rbac:rp:manager",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Role Policy: manager.",
                "Target": {
                    "Apply": {
                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                        "Argument": [
                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:manager" } },
                            { "AttributeDesignator": {
                                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                                "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                        ]
                    }
                },
                "CombinerInput": [ { "PolicyReference": { "Id": "urn:example:rbac:pp:manager" } } ]
            },
            {
                "PolicyId": "urn:example:rbac:rp:employee",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Role Policy: employee.",
                "Target": {
                    "Apply": {
                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                        "Argument": [
                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:employee" } },
                            { "AttributeDesignator": {
                                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                                "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                        ]
                    }
                },
                "CombinerInput": [ { "PolicyReference": { "Id": "urn:example:rbac:pp:employee" } } ]
            },
            {
                "PolicyId": "urn:example:rbac:pp:manager",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Permission Policy: manager. Inherits employee.",
                "CombinerInput": [
                    {
                        "Rule": {
                            "Id": "manager-expense-report",
                            "Effect": "Permit",
                            "Description": "A manager may read and approve expense reports.",
                            "Condition": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                    "Argument": [
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:resources:expense-report" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                            ] } },
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:or",
                                            "Argument": [
                                                { "Apply": {
                                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                                    "Argument": [
                                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "read" } },
                                                        { "AttributeDesignator": {
                                                            "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                            "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                            "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                    ] } },
                                                { "Apply": {
                                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                                    "Argument": [
                                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "approve" } },
                                                        { "AttributeDesignator": {
                                                            "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                            "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                            "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                    ] } }
                                            ] } }
                                    ]
                                }
                            }
                        }
                    },
                    { "PolicyReference": { "Id": "urn:example:rbac:pp:employee" } }
                ]
            },
            {
                "PolicyId": "urn:example:rbac:pp:employee",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Permission Policy: employee.",
                "CombinerInput": [
                    {
                        "Rule": {
                            "Id": "employee-timesheet",
                            "Effect": "Permit",
                            "Description": "An employee may read a timesheet.",
                            "Condition": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                    "Argument": [
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:resources:timesheet" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                            ] } },
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "read" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                            ] } }
                                    ]
                                }
                            }
                        }
                    },
                    {
                        "Policy": {
                            "PolicyId": "urn:example:rbac:pp:employee:has-privileges",
                            "Version": "1.0",
                            "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                            "Description": "HasPrivilegesOfRole: employee.",
                            "Target": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                    "Argument": [
                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" } },
                                        { "AttributeDesignator": {
                                            "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                            "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                            "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                    ]
                                }
                            },
                            "CombinerInput": [
                                {
                                    "Rule": {
                                        "Id": "has-privileges-of-employee",
                                        "Effect": "Permit",
                                        "Condition": {
                                            "Apply": {
                                                "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                                "Argument": [
                                                    { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:employee" } },
                                                    { "AttributeDesignator": {
                                                        "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                        "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                                ]
                                            }
                                        }
                                    }
                                }
                            ]
                        }
                    }
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Bundle:
  PolicyReference:
    Id: "urn:example:rbac:entry-point"
  Policy:
    - PolicyId: "urn:example:rbac:entry-point"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "RBAC entry point: combine the Role Policies."
      CombinerInput:
        - PolicyReference: { Id: "urn:example:rbac:rp:manager" }
        - PolicyReference: { Id: "urn:example:rbac:rp:employee" }

    - PolicyId: "urn:example:rbac:rp:manager"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Role Policy: manager."
      Target:
        Apply:
          FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
          Argument:
            - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:manager" }
            - AttributeDesignator:
                Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      CombinerInput:
        - PolicyReference: { Id: "urn:example:rbac:pp:manager" }

    - PolicyId: "urn:example:rbac:rp:employee"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Role Policy: employee."
      Target:
        Apply:
          FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
          Argument:
            - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:employee" }
            - AttributeDesignator:
                Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      CombinerInput:
        - PolicyReference: { Id: "urn:example:rbac:pp:employee" }

    - PolicyId: "urn:example:rbac:pp:manager"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Permission Policy: manager. Inherits employee."
      CombinerInput:
        - Rule:
            Id: "manager-expense-report"
            Effect: "Permit"
            Description: "A manager may read and approve expense reports."
            Condition:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                Argument:
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:resources:expense-report" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:or"
                      Argument:
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "read" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "approve" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        - PolicyReference: { Id: "urn:example:rbac:pp:employee" }

    - PolicyId: "urn:example:rbac:pp:employee"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Permission Policy: employee."
      CombinerInput:
        - Rule:
            Id: "employee-timesheet"
            Effect: "Permit"
            Description: "An employee may read a timesheet."
            Condition:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                Argument:
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:resources:timesheet" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "read" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        - Policy:
            PolicyId: "urn:example:rbac:pp:employee:has-privileges"
            Version: "1.0"
            CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
            Description: "HasPrivilegesOfRole: employee."
            Target:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                Argument:
                  - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" }
                  - AttributeDesignator:
                      Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                      AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
            CombinerInput:
              - Rule:
                  Id: "has-privileges-of-employee"
                  Effect: "Permit"
                  Condition:
                    Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:employee" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
```

**What this shows**

- All five policies are carried in a single `BundleType` object — a `<Bundle>` element in XML, a `Bundle` object in JACAL/YACAL — whose `PolicyReference` names the **entry-point policy** (`urn:example:rbac:entry-point`), an ordinary `PolicyType` object whose `CombinerInput` is exactly the two Role Policies, referenced ([Section 5.3.5](#535-the-pdp-entry-point)). Trace any path from here: it reaches a Permission Policy only through that role's Role Policy (`rp:*` → `pp:*`) or through the hierarchy (`pp:manager` → `pp:employee`) — the [Section 5.3.5](#535-the-pdp-entry-point) constraint 3 invariant. A deployment need not physically build a `BundleType` object ([[ACAL-Core-1.0](#acal-core-10)] Section 7.46) — the PDP configuration may hold the policies and the starting reference in any form — but it is the clearest way to show the whole set at once.
- Each **Role Policy** carries the role test in its `Target` and nothing else, and a single `PolicyReference` to its Permission Policy ([Section 5.3.1](#531-role-policy)). The `Target` references only the `access-subject` role attribute.
- The **manager Permission Policy** grants its own permission (expense reports) and then `PolicyReference`s the employee Permission Policy — that one line is the entire role hierarchy ([Section 5.3.3](#533-role-hierarchy)). A request from a manager to `read` a `timesheet` is permitted through this reference.
- The **HasPrivilegesOfRole Policy** is nested in the employee Permission Policy. Its `Target` matches only the `has-privileges-of-role` action; its rule tests the role carried as a **resource** attribute ([Section 5.3.4](#534-hasprivilegesofrole-policy)). A manager asking whether they have the employee role's privileges reaches it by the same inheritance reference.
- No construct here is specific to this profile: `PolicyType`, `PolicyReferenceType`, `RuleType`, `BooleanExpressionType` and `BundleType` are all ACAL Core.

## 7.2 An Access Request

A manager asks to `read` a timesheet. The manager holds only the `manager` role. Expected decision: `Permit` — via the manager Permission Policy's inheritance reference to the employee Permission Policy.

**XACML v4.0 (XML)**

```xml
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:subject-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
            <Value>Alice</Value>
        </RequestAttribute>
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:roles:manager</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:resources:timesheet</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
            <Value>read</Value>
        </RequestAttribute>
    </RequestEntity>
</Request>
```

**JACAL v1.0 (JSON)**

```json
{
    "Request": {
        "RequestEntity": [
            {
                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                      "Value": [ "Alice" ] },
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:roles:manager" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:resources:timesheet" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                      "Value": [ "read" ] }
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Request:
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:subject-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
          Value: [ "Alice" ]
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:roles:manager" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:resources:timesheet" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
          Value: [ "read" ]
```

**Evaluation.** The entry point combines the two Role Policies. The `manager` Role Policy's `Target` matches (the subject holds `urn:example:roles:manager`); the `employee` Role Policy's `Target` does not. The `manager` Role Policy references the `manager` Permission Policy, whose own `manager-expense-report` rule does not match (`timesheet` ≠ `expense-report`) but whose `PolicyReference` to the `employee` Permission Policy does: the `employee-timesheet` rule matches `read` on `timesheet` and yields `Permit`. Under permit-overrides the decision is **`Permit`**.

## 7.3 A HasPrivilegesOfRole Request

The same manager asks whether they have the privileges of the `employee` role. The action is `has-privileges-of-role`; the role in question rides as a **resource** attribute. Expected decision: `Permit`.

**XACML v4.0 (XML)**

```xml
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:roles:manager</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:roles:employee</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
            <Value>urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
        </RequestAttribute>
    </RequestEntity>
</Request>
```

**JACAL v1.0 (JSON)**

```json
{
    "Request": {
        "RequestEntity": [
            {
                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:roles:manager" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:roles:employee" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                      "Value": [ "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" ] }
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Request:
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:roles:manager" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:roles:employee" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
          Value: [ "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" ]
```

**Evaluation.** The `manager` Role Policy's `Target` matches. Its Permission Policy references the `employee` Permission Policy, whose nested HasPrivilegesOfRole Policy has a `Target` matching the `has-privileges-of-role` action, and a rule whose condition — the resource role attribute contains `urn:example:roles:employee` — is `true`. Decision: **`Permit`**. Note that the same `urn:oasis:names:tc:acal:1.0:subject:role` `AttributeId` appears in both the subject entity and the resource entity of this one request, which is well-formed because ACAL scopes attribute uniqueness per `RequestEntityType` ([[ACAL-Core-1.0](#acal-core-10)] Section 7.33).

---


# 8 Representation Considerations

[Section 4.3](#43-changes-from-the-previous-version) states that this profile needs no new schema artifacts: Role Policies, Permission Policies and HasPrivilegesOfRole Policies are `PolicyType` objects, their references are `PolicyReferenceType` objects, and the PDP's policy set is a `BundleType` object — all defined by [[ACAL-Core-1.0](#acal-core-10)] and present in each representation's Core schema. There is therefore nothing for this profile's structures that the Core XSD, JSON Schema, or YAML structure/constraint artifacts do not already cover.

The profile's constraints on how policies are shaped and connected are, by their nature, not expressible in a Core schema and an implementation (or its PAP) MUST enforce them itself. They include, but are not limited to:

- **A Role Policy contains exactly one `PolicyReference` and no other combiner input** ([Section 5.3.1](#531-role-policy) constraint 2) — `CombinerInput` is a general list in every representation.
- **A Role Policy's `Target` references only subject-category attributes** ([Section 5.3.1](#531-role-policy) constraint 1) — checkable by walking the expression's `AttributeDesignator`/`AttributeSelector` categories, after variable expansion; not a schema check.
- **A Permission Policy does not restrict subjects in its `Target`** ([Section 5.3.2](#532-permission-policy) constraint 2).
- **The reachability graph** ([Section 5.3.5](#535-the-pdp-entry-point) constraint 3): the `BundleType` object's `PolicyReference` does not name a Permission Policy, and a Permission Policy is reached only through its Role Policy or the hierarchy. Which policies are Permission Policies is a fact about the deployment's RBAC design, not the document structure.
- **The combining-algorithm safety rule** ([Section 5.3](#53-access-control)) and the **HasPrivilegesOfRole Policy shape** ([Section 5.3.4](#534-hasprivilegesofrole-policy)).

Core schema validation checks object *shapes* (a `Policy` has a `CombiningAlgId`, a `CombinerInput` entry is one of `Policy`/`Rule`/`PolicyReference`, and so on); it does not check any of the above.

## 8.1 XML

The `<Bundle>` of [Section 7.1](#71-role-and-permission-policies) uses only the *Core XML Schema*'s `Bundle` element ([[XACML-Core-4.0](#xacml-core-40)]) and, within it, ordinary `Policy` elements: `PolicyReference` and nested `Policy` are among a `Policy`'s permitted children, and `Bundle` permits any number of `Policy` elements followed by one `PolicyReference`. A deployment that does not build a `Bundle` document holds the same policies and the same starting `PolicyReference` in whatever form its PDP configuration takes.

## 8.2 JSON

The `Bundle` object of [Section 7.1](#71-role-and-permission-policies) validates against the *JACAL Core JSON Schema*; `CombinerInput` entries are the standard one-key objects (`Policy`, `PolicyReference` or `Rule`) [[JACAL-Core-1.0](#jacal-core-10)] defines. The uniqueness of `PolicyId` within `Bundle.Policy` is subject to the same `uniqueItems`/keyed-comparison limitation [[JACAL-Core-1.0](#jacal-core-10)] notes for keyed lists generally; an implementation enforcing it does so outside JSON Schema validation.

## 8.3 YAML

The `Bundle` object validates against the *YACAL Core structure schema* [[YACAL-Core-1.0](#yacal-core-10)]; the `acal-core-yaml-v1.0-constraints.yaml` catalog's policy-identifier-uniqueness rule applies to `Bundle.Policy` unchanged. As with JSON, the profile-level constraints above are outside any structural check.

---


# 9 Safety, Security, and Data Protection Considerations

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 11.

The correctness of every decision made under this profile depends on the role attributes in the request context being a true reflection of the roles assigned to, and enabled for, the subject at the time of the request. This profile does not verify that; it is the responsibility of the Role Enablement Authority and the PEP ([Section 5.2](#52-role-assignment-and-enablement)). A PEP that accepts role attributes from an untrusted source, or that fails to bind them to the authenticated subject, defeats the profile.

Several structural mistakes change access silently — no error, just a wrong answer — and are worth checking for explicitly, because none is caught by schema validation ([Section 8](#8-representation-considerations)):

- A **Permission Policy reachable other than through its Role Policy** ([Section 5.3.5](#535-the-pdp-entry-point) constraint 3 forbids it) — named as the entry point, combined by the entry-point policy, referenced by an unrelated policy, or nested — grants that role's permissions to every subject, because nothing then tests for the role. **This is the most serious mistake the profile guards against.**
- A **`permit-unless-deny` or `deny-unless-permit` combining algorithm** on a Role Policy, a Permission Policy, or the entry point ([Section 5.3](#53-access-control) forbids it) turns "no permission applied" into `Permit`.
- A **subject restriction in a Permission Policy's `Target`** ([Section 5.3.2](#532-permission-policy) constraint 2 forbids it) does not cause an error; it makes the Permission Policy `NotApplicable` for a senior role's holders, breaking inheritance — the failure here *narrows* access, but silently, and a policy set with it is not conformant.
- A **`Deny` rule in a Permission Policy** is inherited by every senior role. A prohibition that must hold regardless of role belongs above the entry point under a deny-biased algorithm, not inside a role's permissions — see [Section 6.1](#61-combining-algorithms).
- A **multi-role Permission Policy referenced by another Permission Policy** ([Section 5.4](#54-multi-role-permissions) forbids it) hands the multi-role permissions to a subject who holds only the referencing role, bypassing the simultaneous-role requirement.

Finally, a HasPrivilegesOfRole Policy answers "does this subject have role R?" without the subject attempting any resource access — an information channel that is deliberate but that a deployment should be aware it exposes.

---


# 10 Conformance

## 10.1 Introduction

This profile defines one profile identifier, one recommended role attribute identifier, and one action attribute value, together with the Role Policy / Permission Policy construction of [Section 5](#5-profile). An implementation conforms to this profile as a **policy processor** if it evaluates policies structured per [Section 5](#5-profile) as described there and in [[ACAL-Core-1.0](#acal-core-10)], and as an **RBAC request generator** if it produces requests carrying role attributes per [Section 5.1](#51-roles-and-role-attributes) and, where it supports the HasPrivilegesOfRole Policy, HasPrivilegesOfRole requests per [Section 5.3.4](#534-hasprivilegesofrole-policy).

## 10.2 Conformance Tables

This section lists those portions of the specification that MUST be included in an implementation of a PDP, PAP or PEP that claims to conform to this profile.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-profile) and [Annex C](#annex-c-acal-identifiers) where they apply to implemented items in the following tables.

For every identifier and value below, the ACAL (`urn:oasis:names:tc:acal:1.0:`) form is the one this profile defines and an implementation MUST support it; an implementation MAY additionally recognize the deprecated XACML 3.0 form shown beside it as equivalent (equality is determined after identifier evaluation, [[ACAL-Core-1.0](#acal-core-10)] Section 8.3). It is RECOMMENDED that the deprecated forms not be used in new policies or requests. This is the standard ACAL convention ([[ACAL-Core-1.0](#acal-core-10)] Section 11.2).

### 10.2.1 Profile Identifier

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:profile:rbac | M | urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical |

An implementation claiming conformance to this profile MUST support the Role Policy / Permission Policy construction of [Section 5.3](#53-access-control), including role hierarchy ([Section 5.3.3](#533-role-hierarchy)) and the entry-point constraint ([Section 5.3.5](#535-the-pdp-entry-point)). Support for the HasPrivilegesOfRole Policy ([Section 5.3.4](#534-hasprivilegesofrole-policy)) is OPTIONAL.

### 10.2.2 Attributes

The implementation MUST use the attribute associated with the following identifier in the way this profile has defined (see [Annex C.3](#c3-attributes)) when that identifier is used for a role. This requirement pertains primarily to implementations of a PAP or PEP, since the semantics of the attribute are transparent to the PDP.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:subject:role | O | urn:oasis:names:tc:xacml:2.0:subject:role |

Note: `O` because [Section 5.1](#51-roles-and-role-attributes) RECOMMENDS but does not require this identifier — a deployment MAY use others for roles. An implementation that supports this profile SHOULD recognize this identifier.

### 10.2.3 Action Attribute Values

The implementation MUST use the following action attribute value as this profile has defined ([Section 5.3.4](#534-hasprivilegesofrole-policy)) where it supports the HasPrivilegesOfRole Policy.

| Value | M/O | Deprecated Value |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role | O | urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole |

Note: `O` because the HasPrivilegesOfRole Policy is itself optional.

---


# Annex A License, Document Status and Notices


(This annex forms an integral part of this Specification.)


## A.1 Document Status


This document was last revised or approved by the OASIS eXtensible Access Control Markup Language (XACML) TC on the above date. The level of approval is also listed above. Check the "Latest version" location noted above for possible later revisions of this document. Any other numbered Versions and other technical work produced by the Technical Committee (TC) are listed at https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=67afe552-0921-49b7-9a85-018dc7d3ef1d#technical.


TC members should send comments on this document to the TC's email list. Others should send comments to the TC's public comment list, after subscribing to it by following the instructions at the "Send A Comment" button on the TC's web page at https://www.oasis-open.org/committees/xacml/.


NOTE: any machine-readable content (Computer Language Definitions) declared Normative for this Work Product is provided in separate plain text files. In the event of a discrepancy between any such plain text file and display content in the Work Product's prose narrative document(s), the content in the separate plain text file prevails.


## A.2 License and Notices


Copyright © OASIS Open 2026. All Rights Reserved.


All capitalized terms in the following text have the meanings assigned to them in the OASIS Intellectual Property Rights Policy (the "OASIS IPR Policy"). The full Policy, which governs the licensure of this document, may be found at the OASIS website: [[https://www.oasis-open.org/policies-guidelines/ipr/](https://www.oasis-open.org/policies-guidelines/ipr/)]


This document and translations of it may be copied and furnished to others, and derivative works that comment on or otherwise explain it or assist in its implementation may be prepared, copied, published, and distributed, in whole or in part, without restriction of any kind, provided that the above copyright notice and this section are included on all such copies and derivative works. However, this document itself may not be modified in any way, including by removing the copyright notice or references to OASIS, except as needed for the purpose of developing any document or deliverable produced by an OASIS Technical Committee (in which case the rules applicable to copyrights, as set forth in the OASIS IPR Policy, must be followed) or as required to translate it into languages other than English.


The limited permissions granted above are perpetual and will not be revoked by OASIS or its successors or assigns, as provided in the OASIS IPR Policy.


This document is provided under the [RF on Limited Terms](https://www.oasis-open.org/policies-guidelines/ipr/#RF-on-Limited-Mode) IPR mode that was chosen when the project was established, as defined in the IPR Policy. For information on whether any patents have been disclosed that may be essential to implementing this document, and any offers of patent licensing terms, please refer to the Intellectual Property Rights section of the project's web page ([XACML IPR Policy](https://www.oasis-open.org/committees/xacml/ipr.php)).


This document and the information contained herein is provided on an "AS IS" basis and OASIS DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION HEREIN WILL NOT INFRINGE ANY OWNERSHIP RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. OASIS AND ITS MEMBERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THIS DOCUMENT OR ANY PART THEREOF.


As stated in the OASIS IPR Policy, the following three paragraphs in brackets apply to OASIS Standards Final Deliverable documents (Committee Specifications, OASIS Standards, or Approved Errata).


OASIS requests that any OASIS Party or any other party that believes it has patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable, to notify OASIS TC Administrator and provide an indication of its willingness to grant patent licenses to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this deliverable.


OASIS invites any party to contact the OASIS TC Administrator if it is aware of a claim of ownership of any patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable by a patent holder that is not willing to provide a license to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this OASIS Standards Final Deliverable. OASIS may include such claims on its website, but disclaims any obligation to do so.


OASIS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this OASIS Standards Final Deliverable or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on OASIS' procedures with respect to rights in any document or deliverable produced by an OASIS Technical Committee can be found on the OASIS website. Copies of claims of rights made available for publication and any assurances of licenses to be made available, or the result of an attempt made to obtain a general license or permission for the use of such proprietary rights by implementers or users of this OASIS Standards Final Deliverable, can be obtained from the OASIS TC Administrator. OASIS makes no representation that any information or list of intellectual property rights will at any time be complete, or that any claims in such list are, in fact, Essential Claims.


The name "OASIS" is a trademark of OASIS, the owner and developer of this document, and should be used only to refer to the organization and its official outputs. OASIS welcomes reference to, and implementation and use of, its documents, while reserving the right to enforce its marks against misleading uses. Please see [OASIS Trademark Policy](https://www.oasis-open.org/policies-guidelines/trademark/) for guidance.


---


# Annex B References


(This annex forms an integral part of this Specification.)


This section contains the normative and informative references that are used in this document.


Normative references are specific (identified by date of publication and/or edition number or version number) and Informative references are either specific or non-specific. For specific references, only the cited version applies. For non-specific references, the latest version of the reference document (including any amendments) applies. While any hyperlinks included in this section were valid at the time of publication, OASIS cannot guarantee their long term validity.


## B.1 Normative References


The following documents are referenced in such a way that some or all of their content constitutes requirements of this document.

###### [ACAL-Core-1.0]

Attribute-Centric Authorization Language (ACAL) Version 1.0. Edited by Steven Legg and Cyril Dangerville. 18 February 2026. OASIS Committee Specification Draft 01.

###### [RBAC]

XACML v3.0 Core and Hierarchical Role Based Access Control (RBAC) Profile Version 1.0. Edited by Erik Rissanen. 23 October 2014. OASIS Committee Specification 02. https://docs.oasis-open.org/xacml/3.0/rbac/v1.0/cs02/xacml-3.0-rbac-v1.0-cs02.html . Latest stage: https://docs.oasis-open.org/xacml/3.0/rbac/v1.0/xacml-3.0-rbac-v1.0.html .

###### [RFC2119]

RFC 2119, *Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC8174]

RFC 8174, *Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174


## B.2 Informative References


The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [ANSI-RBAC]

INCITS 359-2004, *Information Technology — Role Based Access Control*, American National Standards Institute / International Committee for Information Technology Standards, 2004.

###### [XACML-Core-4.0]

_eXtensible Access Control Markup Language (XACML) Version 4.0_. Edited by Steven Legg and Cyril Dangerville. 18 February 2026. OASIS Committee Specification Draft 01. https://docs.oasis-open.org/xacml/acal/xacml/core/v4.0/csd01/acal-core-xml-v4.0-csd01.html.

###### [JACAL-Core-1.0]

_JSON Representation of ACAL Version 1.0 (JACAL)_. Edited by Steven Legg and Cyril Dangerville. OASIS Committee Specification Draft 02. https://docs.oasis-open.org/xacml/acal/jacal/core/v1.0/csd02/acal-core-json-v1.0-csd02.html.

###### [YACAL-Core-1.0]

_YAML Representation of ACAL (YACAL) Version 1.0_. Edited by Steven Legg and Cyril Dangerville. 23 March 2026. Working Draft 01. Not yet submitted to OASIS for consideration; no stable publication URL exists at this stage.


---


# Annex C ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## C.1 ACAL Namespaces

This ACAL Profile is defined using this identifier.

`urn:oasis:names:tc:acal:1.0:rbac:schema`

## C.2 Profile Identifiers

See [Section 10.2.1](#1021-profile-identifier) for the single profile identifier this document defines and its deprecated XACML 3.0 equivalent.

## C.3 Attributes

This profile defines the following ACAL attribute identifier — for a `RequestAttributeType` object carrying a role — as the ACAL form of the XACML 3.0 RBAC profile's role attribute. It introduces no new attribute *object type* and no new schema artifact.

`urn:oasis:names:tc:acal:1.0:subject:role`

: RECOMMENDED as the `AttributeId` for every role attribute ([Section 5.1](#51-roles-and-role-attributes)). Corresponding attribute values SHOULD be of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI`. Ordinarily carried in a subject `RequestEntityType` object; carried in the resource `RequestEntityType` object in a request evaluated by a HasPrivilegesOfRole Policy ([Section 5.3.4](#534-hasprivilegesofrole-policy)). Deprecated identifier: `urn:oasis:names:tc:xacml:2.0:subject:role`.

## C.4 Action Attribute Values

This profile defines one standard value for the `urn:oasis:names:tc:acal:1.0:action:action-id` attribute:

`urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`

: The value of the `action-id` attribute in a request asking whether a subject has the privileges of a role ([Section 5.3.4](#534-hasprivilegesofrole-policy)). Deprecated value: `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole`.

---

# Annex D How to generate HTML and PDF versions

## Online generation

HTML/PDF versions are generated automatically online via Github Actions after each update pushed to the main branch of [OASIS XACML TC Github repository](https://github.com/oasis-tcs/xacml-spec/). Go to  Github Actions on the github repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

## Offline generation

### Prerequisites

Install Pandoc **v3.2.1 or later** ( [latest release](https://github.com/jgm/pandoc/releases/latest) ), Graphviz and PlantUML on your system; or simply use Docker with the following shell alias:
```
$ alias pandoc='docker run --rm --volume "$(pwd):/data" ghcr.io/oasis-tcs/pandoc-plantuml'
```
_The Dockerfile (named `Dockerfile`) of the docker image used in the alias above is provided in the [pandoc](pandoc) folder next to this markdown file for your convenience if you wish to build it yourself._

Git clone or get a local copy of [OASIS XACML TC Github repository](https://github.com/oasis-tcs/xacml-spec/), open a terminal and **change your working directory to the root directory of your local copy of the repository**.

### CSS stylesheet

The generation command uses a CSS stylesheet file (`-c` argument) provided by OASIS. It may be changed to one of these (or the local version in the `styles` folder) to get a different style of output:
- https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3.css
- https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3a.css (this one produces HTML that resembles the github display more closely, especially for blocks of code) This template already includes a reference (in HTML code) to this .css file.
- https://docs.oasis-open.org/templates/css/markdown-styles-v1.8.1-cn_final.css

### HTML generation

Run the following command line to generate the HTML from this markdown file (input file specified as last argument):

```console
$ pandoc/mkdocs.sh --output /tmp acal-rbac-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

Do not add `--number-lines`: this document has no `{.numberLines}` code fences, and the flag switches pandoc's markdown reader in a way that strips the leading section-number segment from every auto-generated heading anchor (`#1-scope` becomes `#scope`), breaking this document's own cross-references.

### PDF generation

Same as HTML generation above, but replace the `.html` output extension with `.pdf` — i.e. the tool produces a PDF when the output path ends in `.pdf`. See the comments at the top of `pandoc/mkdocs.sh` for the full set of options.

---


# Appendix 1 Acknowledgments


(This appendix does not form an integral part of this Specification and is informational.)


## Leadership


The following individuals have had significant leadership positions during the development of this document, not just this version of the document, and they are gratefully acknowledged:


- Chairs
  - Bill Parducci, Individual
- Secretaries
  - Bill Parducci, Individual
- Editors
  - Steven Legg, ViewDS Identity Solutions
  - Cyril Dangerville, THALES


## Special Thanks


The following individuals have made substantial contributions to this document, not just this version of the document, and their contributions are gratefully acknowledged:

- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES


## Participants


The following individuals were members of this committee during the creation of this document, not just this version of the document, and their contributions are gratefully acknowledged:

**XACML TC Members:**

- Hal Lockhart, Individual
- Bill Parducci, Individual
- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES


---


# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)

This is the first version of this profile. See [Section 4.3](#43-changes-from-the-previous-version) for the changes relative to its XACML 3.0 predecessor.

## Revision History

Latest revision history can be obtained from [OASIS XACML TC's github repository](https://github.com/oasis-tcs/xacml-spec/blob/v%version%-%stage_revision%/acal-rbac-v%version%-%stage_revision%.md).

<!-- The following centered line represents the end of the document -->
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
