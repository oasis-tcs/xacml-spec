# ACAL Multiple Decision Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL Multiple Decision Profile (`acal-multiple-v1.0.md`, cited here as [MDP-ACAL]) who knows ACAL but hasn't necessarily followed the XACML 3.0 Multiple Decision Profile, issue #59's history, or how this profile relates to the Hierarchical Resource Profile it was blocked behind.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML 3.0 source it ports
2. Implementers deciding whether, and how, to support multiple-decision requests
3. Anyone reviewing issue #59 who wants to understand why the actual scope is bigger than the issue's own title suggests

This guide is explanatory and informative. It does not replace [MDP-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core already carries the *syntax* this profile gives *meaning* to. `RequestType.MultiRequests`, `RequestReferenceType`, and the rule that repeated `RequestEntityType` categories are a syntax error "unless the PDP implements the multiple decision profile" all already exist in `acal-core-v1.0.md` — this profile is what makes those structures actually mean something, plus two schemes (`scope`, XPath-expression) that expand a single request into several without any special request structure at all. Like the Hierarchical Resource Profile, this profile introduces no new object types — it's entirely attribute identifiers and normative prose over structures Core already defines.

---

## Issue #59 Understated Its Own Scope

The issue as filed names two renames (`Attributes`→`RequestCategory`, `AttributesReference`→`RequestCategoryReference`) as the reason this profile needs updating. Neither name is even right — the actual rename produced `RequestEntity`/`RequestEntityReference`, and a later issue (#101) changed the reference's shape again, removing its `Id` property entirely so the reference *is* a bare value now. But the deeper issue is that **those renames only touch one of this profile's five schemes** (reference, [Section 5.4](acal-multiple-v1.0.md#54-reference)). The other four — repeated categories, combined decision, scope, and XPath expression — all need rework for reasons the issue doesn't mention at all: the `RequestEntity` rename generally, the `Notice` merge (issue #6) rewriting the combined-decision rules, and a normative dependency on the Hierarchical Resource Profile for two of the five schemes.

**What to check as a reviewer**: don't review this PR against issue #59's stated scope — review it against [Section 4.2](acal-multiple-v1.0.md#42-changes-from-the-previous-version)'s actual accounting, which is considerably longer.

---

## The Dependency on HRP, and Why It Doesn't Show Up as a Diff Against HRP's Content

Two of this profile's five schemes needed the Hierarchical Resource Profile (#119) before they could be drafted:

- **`scope`**'s `Children`/`Descendants` values need a definition of what a child or descendant *is*. This profile defines `Child`/`Descendant` itself ([Section 2.1.2](acal-multiple-v1.0.md#212-terms-defined-in-this-document)), but builds them directly on top of HRP's `Node`/`Hierarchy`/`Ancestor` vocabulary ([Section 2.1.2](acal-hierarchical-v1.0.md#212-terms-defined-in-this-document) of that document) rather than duplicating it.
- **XPath expression**'s attribute rewriting depends on the plain `content-selector` identifier, which — since issue #118 — is actually defined in the ACAL XPath Profile, not in HRP itself. HRP references it the same way this profile does. Neither profile redefines it.

**What to check**: this profile does not *modify* HRP or the XPath Profile — it only references terms and identifiers those documents already define. If you're checking whether this profile genuinely needed HRP drafted first, the answer is yes for `scope`'s vocabulary, but the dependency is conceptual (borrowed terms), not a shared code path that could drift silently.

---

## This Version Is XML-Only, Same Reasoning as HRP

[Section 5.2](acal-multiple-v1.0.md#52-nodes-identified-by-xpath-expression) (XPath expression) only applies to XML `Content`, for the identical reason HRP's XML-document scheme is XML-only: the ACAL JSONPath Profile doesn't yet have the identifier/conformance infrastructure a JSON counterpart would need. This is the same decision, made the same way, disclosed the same way — see [Section 4.2](acal-multiple-v1.0.md#42-changes-from-the-previous-version). If you already reviewed HRP's version of this reasoning, this is not a new gap to evaluate independently; it's the same one, applied consistently.

---

## The Dangling-Reference Layering Question

XACML 3.0 MDP says a dangling `RequestEntityReference` produces `Indeterminate` with a `syntax-error` status *at evaluation time*. ACAL Core's own schema (`xs:keyref`) already catches the same defect *at validation time*, before evaluation would even begin — a layer XACML 3.0 didn't have. [Section 5.4](acal-multiple-v1.0.md#54-reference) resolves the apparent conflict by saying both layers are normative: a validating implementation catches it earlier, a non-validating one must still catch it at evaluation time, so the guarantee holds either way. **What to check**: this is exactly the kind of layering question this repo's diary flags as needing an explicit "which layer is normative" answer rather than silence — confirm the profile actually gives one (it does, in the paragraph above).

---

## The Five Schemes at a Glance

| Scheme | Expands one request into... | Needs |
|---|---|---|
| Repeated Categories ([5.3](acal-multiple-v1.0.md#53-repeated-categories)) | Cross product of repeated same-`Category` entities | ACAL Core only |
| Reference ([5.4](acal-multiple-v1.0.md#54-reference)) | One request per `RequestReference` | ACAL Core only |
| Scope ([5.1](acal-multiple-v1.0.md#51-nodes-identified-by-scope)) | One request per child/descendant node | ACAL Hierarchical Resource Profile (vocabulary only) |
| XPath Expression ([5.2](acal-multiple-v1.0.md#52-nodes-identified-by-xpath-expression)) | One request per XPath-selected node | ACAL XPath Profile (`content-selector`) |
| Combined Decision ([6](acal-multiple-v1.0.md#6-combined-decision)) | *Merges* several decisions back into one | None of the above — orthogonal, can combine with any of them |

All four request-construction schemes plus combined decision are independently optional. [Section 7](acal-multiple-v1.0.md#7-conceptual-model-for-creating-individual-decision-requests) (conceptual model) is the one mandatory section, but its *mandatoriness* is conditional — it binds an implementation only once it claims support for at least one of the other five.

---

## Published Artifact Set

No new schema files, same as HRP: no XSD, JSON Schema, or YAML constraint catalog. `acal-multiple-v1.0.md` and this guide are the complete deliverable for this version.

---

## Worked Example Walkthrough

[MDP-ACAL] Section 8 gives one example per applicable scheme, and — like [HRP-ACAL]'s Section 7 — deliberately spans all three ACAL representations, one per example, precisely to demonstrate that this profile's schemes are representation-agnostic rather than XML-specific:

- [Section 8.1](acal-multiple-v1.0.md#81-repeated-categories) (Repeated Categories) is XACML v4.0/XML.
- [Section 8.2](acal-multiple-v1.0.md#82-reference) (Reference) is JACAL/JSON, requesting the same two resources shown in 8.1 by `RequestReference` instead of by repeated categories.
- [Section 8.3](acal-multiple-v1.0.md#83-combined-decision) (Combined Decision) reuses 8.1's scenario again, this time in YACAL/YAML, with `CombinedDecision` set to `true`.

**What to check as a reviewer:** the three examples are not independent scenarios — 8.2 and 8.3 both request the same underlying two-resource access as 8.1, just via a different scheme and a different representation. If you are checking that this profile is genuinely format-agnostic (not merely format-agnostic in its normative prose while its only worked examples stay XML), confirming that the JSON and YAML examples parse and validate against `acal-core-json-v1.0-schema.json` and the YACAL structural conventions is the concrete way to do that, rather than taking the representation-agnostic claim on faith. The XPath-expression scheme ([Section 5.2](acal-multiple-v1.0.md#52-nodes-identified-by-xpath-expression)) is the one exception — it is XML-only by design (see above) and has no example of its own in Section 8; do not expect a JSON or YAML worked example for it.

---

## Review Guidance for ACAL Reviewers New to This Profile

- **Don't grade this PR against issue #59's stated scope** — grade it against Section 4.2's actual accounting, which is considerably larger than two renames.
- **Verify the `Child`/`Descendant` definitions genuinely build on HRP's vocabulary** rather than silently duplicating or contradicting it — check Section 2.1.2 of both documents side by side.
- **Confirm the combined-decision `Notice` rule** (Section 6, rule 3) actually covers both obligations and advice, not just one — this is a deliberate broadening from XACML 3.0's "obligations or advice" wording collapsing onto ACAL's single `Notice`/`IsObligation` model.
- **Check the dangling-reference layering paragraph is actually there and says something concrete** (Section 5.4) — a profile that mentions a layering conflict exists without resolving it would be worse than not mentioning it at all.
- **Treat the XML-only scoping the same way you treated HRP's** — same decision, same reasoning, not a fresh judgment call each time it appears in a new document.
- **Verify the JSON and YAML worked examples independently, not just the XML one** — Section 8.2's JACAL example and Section 8.3's YACAL example are the profile's evidence that its schemes are genuinely representation-agnostic, not XML with a format-agnostic claim attached. Parse and, ideally, schema-validate them rather than reading them as prose illustrations.

---

## Bottom Line

This profile ports four independently optional ways to expand one ACAL request into several, plus a combined-decision scheme to merge results back, introduces no new schema artifacts, and needed the Hierarchical Resource Profile only for two schemes' vocabulary and one shared attribute identifier — not for any shared code path that could drift. The scope issue #59 actually represents is considerably larger than its own filed text suggests, and this profile addresses the full scope rather than just the two renames named in the issue.
