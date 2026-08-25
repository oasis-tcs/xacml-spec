# ACAL SAML Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL SAML Profile (`acal-saml-v1.0.md`, cited here as [ACAL-SAML]) who knows ACAL but is not necessarily deep in SAML 2.0 or its XACML SAML Profile predecessor, or who is trying to understand why this version covers so little of its source document.

It is intended to be useful to:

1. TC reviewers checking this profile's scope against issue #60, the issue that motivated authoring it
2. Implementers deciding whether to build the SAML policy-conveyance mechanism this version defines
3. Anyone who expects an ACAL port of *XACML SAML Profile Version 2.0* to cover its full source document and needs to understand, up front, that this one deliberately covers only one part of it

This guide is explanatory and informative. It does not replace [ACAL-SAML] itself, which is the normative document.

---

## Scope: What This Version Covers, and What It Deliberately Does Not

**Read this section before anything else in this guide, or in the specification itself.** *XACML SAML Profile Version 2.0* (Committee Specification 02) covers seven numbered top-level sections (§2–§8), spanning eight distinct conformance-bearing pieces of functionality since §3 alone covers two separate SOAP bindings: Attributes (§2), two SOAP bindings (§3), Authorization Decisions (§4), a WS-Trust alternative (§5), Policies (§6), Advice (§7), and Authorization Tokens (§8). **This version of the ACAL SAML Profile ports only the Policies mechanism** — `XACMLPolicyStatementType`, `ReferencedPoliciesType`, and `XACMLPolicyQueryType`/`PolicyPatternMatchReference`, plus the requirements governing their use as an XACMLPolicy Assertion/Response (`acal-saml-v1.0.md` [Section 5](acal-saml-v1.0.md#5-policies)) — including the shared `ReferencedPoliciesType` definition the source document's §4.10 and §6.1 both depend on. §2, §3, §4's Authorization Decisions query/response mechanism itself, §5, §7, and §8 are **not** covered by this branch.

This is a deliberate scope decision, confirmed with the user/TC, not an oversight or an incomplete draft. The reasoning, in brief (full detail in `acal-saml-v1.0.md` [Section 4.2](acal-saml-v1.0.md#42-changes-from-the-previous-version)):

- The sole GitHub issue motivating this profile, issue #60, is entirely about one narrow schema defect: the source document's `XACMLPolicyQueryType` references `<xacml:PolicySetIdReference>`/`<xacml:PolicyIdReference>`, both of which are incoherent against ACAL Core's post-#16 policy-reference redesign (`PolicySet` removed; `IdReferenceType` replaced by a small type hierarchy).
- Porting the remaining seven-eighths of the source document — SOAP framing, WS-Trust, Advice, Authorization Tokens — is unmotivated by any open issue and would have made this branch far larger than the Hierarchical Resource and Multiple Decision Profile branches combined, with no TC request driving most of that size.
- **What to check as a reviewer:** if you came here expecting a full SAML integration profile, this is that profile's first, narrowest slice, not the whole thing. The remaining sections are expected to be addressed by later, separately-scoped profile work — treat their absence as a tracked gap, not a defect in this document.

---

## The Substantive Change: `PolicySet` Removal Ripples Into SAML's Own Schema

The one thing worth understanding in detail before reviewing the schema is this: ACAL Core's issue #16 redesign didn't just rename `PolicySet` to `Policy` — it eliminated the type entirely, merging it into `PolicyType` (a policy nests other policies via its own `CombinerInput` property). That single upstream decision ripples through every schema fragment this profile ports:

- `XACMLPolicyStatementType`'s and `ReferencedPoliciesType`'s `<xacml:Policy>`/`<xacml:PolicySet>` **choice** collapses to a single, repeated `Policy` **element** — there is no longer a second branch to choose between.
- `XACMLPolicyQueryType`'s `<xacml:PolicySetIdReference>` branch is dropped outright — nothing left to reference.
- `XACMLPolicyQueryType`'s `<xacml:PolicyIdReference>` branch (a bare, argument-less identifier-plus-version-pattern reference) is replaced by a new element, `PolicyPatternMatchReference`, of ACAL Core's existing `PatternMatchIdReferenceType` — not `PolicyReferenceType`, which carries parameterized-policy `Argument` machinery this use case doesn't need. This is the exact fix issue #60's own comment thread converged on and left as an agreed-but-unwritten schema fragment; this profile is where it actually gets written.

**What to check:** every one of these four points should be independently traceable to `acal-core-v1.0.md` §7.4/§7.8–7.11, not just asserted. If you're checking this profile against the source CS02 document side-by-side, expect every `PolicySet` reference in the source to have vanished here — its absence is the change, not a gap.

---

## A Departure From the Established Core-Citation Pattern, and Why

The Hierarchical Resource and Multiple Decision Profiles both classify `[XACML-Core-4.0]`/`[JACAL-Core-1.0]`/`[YACAL-Core-1.0]` as *Informative* references, on the reasoning that a conformant ACAL implementation needs Core plus *at least one* of the three representations, so a representation-neutral profile document can never correctly declare any single one of them as *the* required reference.

**This profile departs from that pattern deliberately**: `[XACML-Core-4.0]` (the XML representation) is a *Normative* reference here ([Annex B.1](acal-saml-v1.0.md#b1-normative-references)). The reasoning that makes the other two profiles' citations Informative — "no single representation is unconditionally required" — does not hold for a profile that is XML-only by its nature. Every conformant implementation of this profile needs the XML representation of ACAL Core, full stop, so it is unconditionally Normative here, not merely Informative-because-representation-choice-varies.

**What to check:** this is a considered exception, not an inconsistency to flag and fix. If a future reviewer proposes moving this citation to Informative "for consistency with HRP/MDP," the correct response is to point at this reasoning, not to apply the other profiles' rule mechanically.

---

## Namespace Design: Two Namespaces, Matching the Source and Issue #60

The source document splits its SAML extensions across two namespaces/schema documents (`xacml-saml` for assertion-side types, `xacml-samlp` for protocol-side types), because it in turn extends SAML 2.0's own two-schema split. This profile preserves that split: `XACMLPolicyStatementType` and `ReferencedPoliciesType` live in an assertion-side namespace (`acal-saml-assertion-xml-v4.0-schema.xsd`, `urn:oasis:names:tc:xacml:4.0:profile:saml2.0:schema:assertion`); `XACMLPolicyQueryType` and `PolicyPatternMatchReference` live in a protocol-side namespace (`acal-saml-protocol-xml-v4.0-schema.xsd`, `urn:oasis:names:tc:xacml:4.0:profile:saml2.0:schema:protocol`).

**This was a genuine design question, not a foregone conclusion, and it's worth knowing how it was resolved.** An earlier draft of this profile unified both into one namespace, on the reasoning that ACAL Core had already applied an analogous simplification once (unifying XACML 3.0's separate policy and context schemas into one). A two-model red-team review, followed by a dedicated consultation with both models specifically on this question, converged independently and with high confidence on keeping the split: issue #60's own comment thread agreed the *element name and base type* (`PolicyPatternMatchReference` of `core:PatternMatchIdReferenceType`) but wrote its agreed fragment assuming the two-namespace split still holds (`samlp:PolicyPatternMatchReference`); the ACAL Core policy/context analogy doesn't transfer, since that merge was of schemas ACAL Core itself owns, where SAML 2.0's assertion/protocol split belongs to an external, frozen 2005 OASIS Standard this profile only extends; and no other SAML profile's extension schema is known to merge the two. Namespace URIs are also a one-way door once published — cheap to keep separate now, costly to un-merge later if implementations pick up a unified one.

**What to check:** `XACMLPolicyStatementType` (assertion-side, used via `xsi:type` on the pre-existing `saml:Statement` element — no new element is declared for it) lives in the assertion namespace; `XACMLPolicyQueryType`/`PolicyPatternMatchReference` (protocol-side, declared as new top-level elements, since `samlp:RequestAbstractType` is abstract with no concrete element to substitute for) live in the protocol namespace, matching where issue #60's own fragment put them.

---

## Published Artifact Set

- `acal-saml-v1.0.md` — the normative specification (this guide's subject)
- `acal-saml-v1.0-reviewer-guide.md` — this document
- `acal-saml-assertion-xml-v4.0-schema.xsd` — schema for `XACMLPolicyStatementType` and `ReferencedPoliciesType`; imports `acal-core-xml-v4.0-schema.xsd` and the real SAML 2.0 assertion schema by URL
- `acal-saml-protocol-xml-v4.0-schema.xsd` — schema for `XACMLPolicyQueryType` and `PolicyPatternMatchReference`; imports `acal-core-xml-v4.0-schema.xsd` and the real SAML 2.0 protocol schema by URL

**Unlike the Hierarchical Resource and Multiple Decision Profiles, this profile does define new schema** — the source document's Policies mechanism is genuine new wire-protocol schema, not new attribute identifiers layered on existing object types. **Unlike the XPath Profile, there is no separate identifier-reference artifact**: this profile defines exactly one conformance identifier (`urn:oasis:names:tc:acal:1.0:profile:saml:policies`, [Annex C.2](acal-saml-v1.0.md#c2-profile-identifiers)) and two schema namespaces (see "Namespace Design" below), both small enough to state directly in the specification's own Annex C.

There is no JACAL or YACAL schema artifact for this profile, and none is planned for a future version — see [Section 1](acal-saml-v1.0.md#1-scope): SAML 2.0, which this profile extends directly, is an XML standard, so this profile is XML-only in its entirety, unlike HRP's/MDP's per-scheme XML-only calls. Note this is a narrower claim than "SOAP-only": neither this profile nor its source document's Policies mechanism requires any particular transport binding — the source document's SOAP bindings (§3) are for the separate Attributes mechanism this branch doesn't port at all.

---

## Review Guidance for ACAL Reviewers New to This Profile

- **Read the Scope section above, and `acal-saml-v1.0.md` [Section 4.2](acal-saml-v1.0.md#42-changes-from-the-previous-version), before comparing this document against the published CS02 side-by-side.** Most of the source document's content is intentionally absent; treat every absent section as a scoping decision to verify, not a completeness bug to report.
- **Trace the `PolicySet`-removal ripple back to `acal-core-v1.0.md`.** Don't take this profile's `Policy`-only schema on faith — confirm against Core §7.4 that `PolicySet` really doesn't exist as a distinct type, and against §7.8–7.11 that `PatternMatchIdReferenceType` really is the right base for `PolicyPatternMatchReference`.
- **Check the two worked examples in [Section 6](acal-saml-v1.0.md#6-examples-non-normative) against the schema, not just for plausibility.** Both were validated well-formed via `xmllint`, and the response/query pair is designed to correlate (`InResponseTo` matches the query's `ID`) — verify that correlation is intact if either example is edited.
- **[Section 5.5](acal-saml-v1.0.md#55-xacmlpolicy-response-requirements) carries several MUST-level rules from the source document's §6.4/§6.6/§6.7** (assertion cardinality on response, `saml:Subject` exclusion, `TooManyResponses` status, `InResponseTo` correlation, implementation-defined reference resolution) that are easy to miss when skimming only §5.1–5.4's type definitions — confirm each is still present and still traces to the source text cited above if this document is edited further.
- **The Normative-vs-Informative Core citation departure (above) is easy to flag as an inconsistency against HRP/MDP if you don't read the reasoning first** — it is correct, not an oversight.
- **If you are the one who eventually scopes the follow-on branch covering §2/§3/§4's query mechanism/§5/§7/§8**, this profile's `ReferencedPoliciesType` is already defined and shared-ready — reuse it rather than redefining it, per this profile's own [Section 5.3](acal-saml-v1.0.md#53-referencedpoliciestype) note.

---

## Bottom Line

This profile resolves the specific schema defect issue #60 raised (a `PolicySet`/`PolicyIdReference` choice with no coherent ACAL equivalent), using the element name and base type already agreed in that issue's own comment thread, and ports the surrounding Policies mechanism (`XACMLPolicyStatementType`, `ReferencedPoliciesType`, `XACMLPolicyQueryType`, and the source document's §6.1/§6.4/§6.6/§6.7 requirements governing how they're used — enclosure in an assertion, `saml:Subject` exclusion, response cardinality, `TooManyResponses` status, `InResponseTo` correlation, and implementation-defined reference resolution) needed to make that resolution usable, not just the bare schema fragment issue #60's thread literally discussed. It deliberately does not port the rest of its XACML 3.0 source document (Attributes, SOAP bindings, the Authorization Decisions query/response mechanism, WS-Trust, Advice, Authorization Tokens) — that is a scoping decision stated explicitly in the specification's own Changes section, not an incompleteness to be discovered in review. One departure from established ACAL profile conventions is deliberate and reasoned, not an oversight: `[XACML-Core-4.0]` is cited Normatively, because this profile is XML-only by nature (unlike HRP/MDP, which are representation-neutral) — not because it is SOAP-specific; this profile carries no transport-binding requirement at all. The source document's assertion/protocol namespace split is preserved, not unified — an earlier draft tried unifying it, but a dedicated two-model consultation converged on keeping the split, matching issue #60's own working assumption; see "Namespace Design" above.
