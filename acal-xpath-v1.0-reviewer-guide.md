# ACAL XPath Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL XPath Profile (`acal-xpath-v1.0.md`, cited here as [XPath-ACAL]) who knows ACAL but has not necessarily worked with XPath, or followed how this profile's extension types plug into ACAL Core's attribute-selector mechanism.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML 3.0 XPath-related mechanisms it succeeds (XACML 3.0 core's `AttributeSelector` and `ContextSelectorId` mechanism, and the `content-selector` attribute identifier the Hierarchical Resource Profile defined for that mechanism to consume)
2. Implementers deciding whether, and how, to support XPath-based attribute extraction from XML `Content`
3. Anyone reviewing the ACAL Hierarchical Resource Profile or Multiple Decision Profile who was told "see the XPath Profile" for `content-selector` and wants to understand what that dependency actually is

This guide is explanatory and informative. It does not replace [XPath-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core defines `AttributeSelectorType` and `EntityAttributeSelectorType` abstractly — an object that selects attribute values out of a `Content` object's `Body` property by some path expression, without specifying what language that path expression is written in. This profile is what makes that abstract mechanism concrete for XML: it defines `XPathAttributeSelectorType` and `XPathEntityAttributeSelectorType` (extensions of Core's types adding a `ContextSelectorId` property and a required `Namespace` property), a `xpathExpression` data type for carrying an XPath expression plus the category it applies to, its own version and namespace bindings, a policy-wide XPath-version defaults type, and three XPath-based functions ([Annex C.3.1](acal-xpath-v1.0.md#c31-xpath-based-functions)) — `xpath-node-count` (returns the size of a node-set), and the two actual comparisons, `xpath-node-equal` and `xpath-node-match`. It also defines `urn:oasis:names:tc:acal:1.0:content-selector` — the standard attribute identifier consumed by `ContextSelectorId` — even though the *concept* originates in the XACML 3.0 Hierarchical Resource Profile, because ACAL deliberately defines a borrowed identifier beside the mechanism that consumes it rather than where XACML happened to put it (see "`content-selector` is defined here, not in HRP" below).

This is the profile the ACAL Hierarchical Resource Profile's XML-document scheme and the ACAL Multiple Decision Profile's XPath-expression scheme both depend on for `content-selector` — if you were told "see the XPath Profile" while reviewing either of those, this is what they meant.

---

## XACML 3.0 to ACAL: Key Changes

### `content-selector` is defined here, not in HRP

In XACML 3.0, `urn:oasis:names:tc:xacml:3.0:content-selector` is defined by the Hierarchical Resource Profile, even though it is consumed by XACML core's `ContextSelectorId` mechanism. ACAL reverses that: the identifier is defined in *this* profile, alongside the `ContextSelectorId` mechanism that consumes it ([Annex D.3](acal-xpath-v1.0.md#d3-attributes)), and the ACAL Hierarchical Resource Profile references this definition rather than restating it (issue #118, resolved 2026-07-28). **What to check as a reviewer:** if you are reviewing HRP or MDP and looking for where `content-selector` is *defined* (as opposed to referenced), it will not be in either of those documents — it is here.

### XPath version identifiers changed, and XPath 1.0 is deprecated

XACML 3.0's XPath 2.0 identifier (`http://www.w3.org/TR/2007/REC-xpath20-20070123`) is deprecated in favor of a new identifier, `https://www.w3.org/TR/xpath20/`. XPath 3.0 and 3.1 are newly supported (`https://www.w3.org/TR/xpath-30/`, `https://www.w3.org/TR/xpath-31/`), with no XACML 3.0 predecessor identifier to deprecate. XPath 1.0 itself is deprecated outright — [Section 6](acal-xpath-v1.0.md#6-xpath-definitions) states this plainly rather than continuing to support it as an option. **What to check:** if you are porting an XACML 3.0 policy that used the old XPath 2.0 identifier, confirm whether it needs updating to the new one. Most other deprecated XACML identifiers in this profile (`content-selector`, the `xpath-node-*` functions) get an explicit "Deprecated Identifier" column in a [Section 9.2](acal-xpath-v1.0.md#92-conformance-tables) conformance table, with implementations MAY-permitted to keep recognizing the old form as equivalent — but the old XPath 2.0 identifier is deprecated only in [Section 6](acal-xpath-v1.0.md#6-xpath-definitions)'s prose, outside any conformance table, so it is not obviously covered by that same MAY-recognize allowance. Treat this as an open question to raise, not a settled equivalence.

### `XPathRequestDefaultsType` is gone; `xpathExpression` values are self-contained instead (issue #134)

Earlier drafts of this profile had a `XPathRequestDefaultsType` paralleling `XPathPolicyDefaultsType` ([Section 5.3.1](acal-xpath-v1.0.md#531-policydefaultstype-extension---xpathpolicydefaultstype)), each carrying a required `XPathVersion` and an optional set of namespace-prefix bindings for the enclosing Request/Policy. steven-legg's issue #134 found a real defect in that design: XML permits the same namespace prefix to be bound to different URIs in different parts of one document, but a single Request-wide table can only bind each prefix once — so two individually-legal XML request entities using the same prefix for different URIs could not both be represented. The fix removes `XPathRequestDefaultsType` entirely (it now has no reason to exist) and makes `XPathExpressionValueType` ([Section 5.3.4](acal-xpath-v1.0.md#534-datatype-extension---xpathexpressionvaluetype)) carry its own `XPathVersion` and `Namespace` locally, in every representation including XML — a value can be copied into a response, cached, or moved between policies, none of which have a Defaults property to inherit from. `XPathPolicyDefaultsType` is unaffected for `XPathVersion` (a selector's `Path` never leaves its policy, so a policy-wide version still works), but it too lost its `Namespace` property: selectors now carry their own `Namespace` locally instead. **What to check:** if you see a reference anywhere in this repository (including HRP's or MDP's examples) to `XPathRequestDefaultsType`, or to a `Namespace` property on `XPathPolicyDefaultsType`/`XPathRequestDefaultsType`, that is stale content from before issue #134 and should have been updated.

### `NamespaceDeclarationType` is a mapping in non-XML representations, and appears in more places now

`NamespaceDeclarationType` ([Section 5.2](acal-xpath-v1.0.md#52-namespacedeclarationtype-optional)) is still **not used in XACML v4.0/XML**, which has native namespace support — but the two XML attachment points don't behave alike post-#134. An XML `xpathExpression` *value* declares its own namespaces with `xmlns:*` attributes directly on the `Value` element itself, unconditionally, because a value can be copied out of its original document. An XML *selector*'s `Path` keeps the pre-existing behavior unchanged: ordinary XML in-scope-namespace lookup, which can be satisfied by an ancestor declaration (every canonical XML Rule example binds `md` on the outer `<Policy>`, not on each `<XPathAttributeSelector>`) — a selector never leaves its policy, so there was never a defect to fix there. In JACAL/YACAL, both attachment points use the new `Namespace` property: a mapping from prefix to namespace name (`{"md": "urn:example:..."}` in JSON, an equivalent mapping in YAML) rather than an array of `{Prefix, Name}` pair-objects — a shape change from before issue #134, made because the old array shape was reused so much more often once every `xpathExpression` value and selector needed its own copy that the array-of-objects form became noticeably more awkward than a plain mapping, in both formats. **What to check:** if you see `NamespaceDeclarationType`/`Namespace` used as an array of pair-objects anywhere in this repository, or a `Namespace` property declared inside an XACML/XML example (it never is — that's a JACAL/YACAL-only property), that's stale content from before issue #134. Do not flag an XML selector without its own `xmlns:*` as a defect — that is the correct, unchanged behavior.

### Implementation-defined XPath behavior is pinned, not left open

[Section 6](acal-xpath-v1.0.md#6-xpath-definitions) works through every item the W3C XPath 2.0/3.0/3.1 specifications leave implementation-defined (Unicode version, collations, implicit timezone, integer overflow behavior, and about a dozen more) and states ACAL's position on each — mostly "implementation defined," but with specific, load-bearing exceptions: the implicit timezone is fixed to UTC, XPath errors during attribute-selector evaluation become `Indeterminate` with `processing-error`, and implementations must support at least the 2025b IANA tz database. **What to check:** this section is long and easy to skim past, but it is where an interoperability bug would actually originate if two independently-written PDPs picked different implementation-defined behaviors for the same policy.

### The worked examples are XACML/JACAL only — there is no YACAL counterpart

This profile's own examples ([Section 4.4](acal-xpath-v1.0.md#44-example)) pair XACML/XML with JACAL/JSON for every rule and request — but there is no YACAL/YAML worked example anywhere in the document, and no `Request.yaml`/`Rule*.yaml` file in `examples/acal-xpath/`. **What to check:** if you are verifying this profile is representation-complete, YAML is the one representation with no worked example to check against; the schema and identifier artifacts are genuinely present for all three representations (see below), but only two of the three get a worked illustration.

---

## Published Artifact Set

Unlike the Hierarchical Resource Profile and Multiple Decision Profile, this profile *does* introduce new schema artifacts, in all three representations:

- `acal-xpath-v1.0.md` — the normative specification (this guide's subject)
- `acal-xpath-v1.0-reviewer-guide.md` — this document
- `acal-xpath-xml-v4.0-schema.xsd`, `acal-xpath-json-v1.0-schema.json`, `acal-xpath-yaml-v1.0-structure.schema.yaml` — the concrete schema for `XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType` in each representation, plus `XPathExpressionValueType` in JSON/YAML only (see below)
- `acal-xpath-xml-v4.0-identifiers.xml`, `acal-xpath-json-v1.0-identifiers.json`, `acal-xpath-yaml-v1.0-identifiers.yaml` — the identifier reference artifacts

**What to check:** confirm the two selector types actually have parity across all three schema files — this guide did not re-derive full type-by-type parity line by line; a careful review should. Do **not** expect parity for `XPathExpressionValueType`: the XSD has no complex type for it at all (XML `xpathExpression` values use Core's generic `ValueType`, whose `xs:anyAttribute` wildcard already permits arbitrary attributes like `XPathVersion` and `xmlns:*` without a dedicated schema addition), while JSON/YAML define it explicitly. This means the required `XPathVersion`/`Namespace` shape on `xpathExpression` values (issue #134) is schema-enforced in JSON/YAML but prose-only in XML — an XML example can be schema-valid while still missing them.

---

## Worked Example Walkthrough

[XPath-ACAL] [Section 4.4](acal-xpath-v1.0.md#44-example) gives a complete worked scenario, not a single isolated snippet: one example medical-record XML document, one example request context, and three example rules ([Section 4.4.4](acal-xpath-v1.0.md#444-example-acal-rule-instances) actually defines three — Rule 1 through Rule 3 — even though this section's own lead sentence used to say "four separate rules are defined"; that miscount was found while writing this guide and has been corrected in the specification) — each pair shown in both XACML/XML and JACAL/JSON. **What to check:** the request context example demonstrates `content-selector` in practice — [Section 4.4.2](acal-xpath-v1.0.md#442-example-request-context) shows a `urn:oasis:names:tc:acal:1.0:content-selector` attribute whose value names the node the rules' `XPathAttributeSelector` elements then reference via `ContextSelectorId`, which is the concrete mechanism [Section 5.3.2](acal-xpath-v1.0.md#532-attributeselectortype-extension---xpathattributeselectortype) describes abstractly. Rule 1 ([Section 4.4.4.1](acal-xpath-v1.0.md#4441-rule-1)) is the simplest — a single `XPathAttributeSelector` and an `xpath-node-match` comparison — and is the one to read first if this is your first time seeing this profile's mechanism in a complete policy. There is no YACAL/YAML version of any of these examples; see above.

---

## Review Guidance for ACAL Reviewers New to This Profile

- **Confirm `content-selector` really is defined here and not duplicated in HRP.** Grep both documents; the identifier should appear defined exactly once (in this profile's [Annex D.3](acal-xpath-v1.0.md#d3-attributes)) and referenced everywhere else.
- **Check the XPath-version-deprecation direction carefully.** XPath 1.0 is deprecated outright (not merely superseded); the XACML 3.0 XPath 2.0 identifier is deprecated in favor of a *new* ACAL XPath 2.0 identifier, not the same URI carried forward — these are two different kinds of change and are easy to conflate.
- **Treat [Section 6](acal-xpath-v1.0.md#6-xpath-definitions)'s implementation-defined-items walkthrough as normative, not filler**, even though it reads like a checklist copied from the W3C spec. The UTC-timezone pin and the `Indeterminate`/`processing-error` error-handling rule are the two easiest to miss and the two most likely to cause real interoperability failures if skipped.
- **Don't assume representation parity from the artifact list alone.** Schema and identifier files exist for XML, JSON, and YAML, but the worked examples only cover XML and JSON — confirm the YAML schema is at least self-consistent even without a worked example to check it against.
- **If you are reviewing HRP or MDP and were told to "see the XPath Profile" for `content-selector`**, this is that profile; you should find one definition here, not a fresh one.
- **Checking issue #134 compliance in an example is not just "look for `Namespace`."** Six things to actually verify, none of which "the JSON/YAML is schema-valid" alone confirms: (1) every `xpathExpression` value carries **both** `XPathVersion` and `Namespace`, not just one; (2) `Namespace` is present as `{}` in JSON/YAML even when the expression uses no prefixed names, never simply omitted; (3) every JACAL/YACAL selector (`XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType`) carries its own required `Namespace`; (4) an XML `xpathExpression` value declares its bindings directly on its own `Value` element, while an XML selector may still rely on an ancestor's `xmlns:*` — don't flag the latter as a defect, and don't accept the former relying on an ancestor; (5) a duplicate key in a serialized `Namespace` mapping is a real defect even though no JSON Schema validator will catch it (see [Section 5.2](acal-xpath-v1.0.md#52-namespacedeclarationtype-optional)'s SHALL); (6) this all applies to XML equally, not just JSON/YAML — since the XSD doesn't define a complex type for `XPathExpressionValueType` at all (see Published Artifact Set above), a schema-valid XML example can still be missing `XPathVersion`/`xmlns:*` entirely.

---

## Bottom Line

This profile turns ACAL Core's abstract attribute-selector mechanism into a concrete XPath-based one, defines `content-selector` on behalf of every profile that needs it (not just itself), pins down XPath's implementation-defined behavior instead of leaving it as a portability trap, and ships schema and identifier artifacts for all three representations — but worked examples for only two of the three (XML and JSON; YAML has none).
