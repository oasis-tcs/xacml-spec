# YACAL Reviewer Guide

## Purpose

This document is a reviewer-oriented companion to the YAML
Representation of ACAL (YACAL) Version 1.0.

Its goal is to help reviewers who already know ACAL very well
understand:

1. what each published YACAL artifact represents
2. how the YACAL work product aligns with the XML/XACML and JSON/JACAL
   work products
3. why the YACAL artifact set is somewhat more explicit
4. why short identifiers are especially important in YACAL examples and
   practice

This guide is explanatory. It does not replace the YACAL specification
or any normative machine-readable artifact.

The internal `work/` and `work/reference/` directories were used during
development and review, but they are not part of the reviewer-facing
publication set.

## Published Artifact Set

The YACAL work product consists of the prose specification plus the
following companion files.

| File | Role | Status | Closest peer analogue |
|---|---|---|---|
| `acal-core-yaml-v1.0-structure.schema.yaml` | Core structural artifact for YACAL shape validation | Normative | XACML core XSD; JACAL core JSON Schema |
| `acal-core-yaml-v1.0-constraints.yaml` | Core higher-order constraint catalog | Normative | XACML Schematron and XSD 1.1 assertion layer; JACAL implementation guidance for richer constraints |
| `acal-core-yaml-v1.0-identifiers.yaml` | Core short-identifier artifact serialized as a YACAL `ShortIdSet` | Normative | `acal-core-xml-v4.0-identifiers.xml`; `acal-core-json-v1.0-identifiers.json` |
| `acal-xpath-yaml-v1.0-structure.schema.yaml` | XPath Profile structural extension artifact | Normative when XPath support is claimed | XPath profile schema artifacts in XML and JSON |
| `acal-xpath-yaml-v1.0-identifiers.yaml` | XPath Profile short-identifier artifact | Normative when XPath support is claimed | XPath profile identifier artifacts in XML and JSON |
| `acal-jsonpath-yaml-v1.0-structure.schema.yaml` | JSONPath Profile structural extension artifact | Normative when JSONPath support is claimed | JSONPath profile schema artifacts in XML and JSON |
| `yacal-root-structure-example-core-only.schema.yaml` | Example root composition schema for core-only support | Informative | JACAL root-combining schema examples |
| `yacal-root-structure-example-using-jsonpath-profile-only.schema.yaml` | Example root composition schema for JSONPath-only support | Informative | JACAL root-combining schema examples |
| `yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml` | Example root composition schema for multi-profile support | Informative | JACAL root-combining schema examples |
| `yacal-root-structure-example-custom-plus-profile.schema.yaml` | Example root composition schema combining standard and custom extensions | Informative | JACAL custom-plus-profile example |

## Alignment with XACML and JACAL

The table below is the quickest way to understand the peer
relationship.

| Capability | XML / XACML | JSON / JACAL | YAML / YACAL | Reviewer takeaway |
|---|---|---|---|---|
| Prose specification | Present | Present | Present | YACAL is not a schema-only artifact; it has a full prose specification like the peer representations |
| Core structural artifact | XSD | JSON Schema | YAML-serialized JSON Schema | Same conceptual layer, different notation choice |
| Richer constraint layer | Schematron and XSD 1.1 assertions guidance | Partly embedded in JSON Schema and implementation guidance | Separate YAML-native constraint catalog | YACAL makes this layer more explicit rather than pretending shape validation is enough |
| Core short-identifier artifact | XML `ShortIdSet` | JSON `ShortIdSet` | YAML `ShortIdSet` | Same ACAL identifier inventory, serialized in each concrete representation |
| XPath profile support | Present | Present | Present | YACAL has peer-level XPath support artifacts |
| JSONPath profile support | Present | Present in peer model | Present | YACAL has peer-level JSONPath structural support |
| Extension composition examples | Mostly implicit via imports and schema mechanisms | Explicit | Explicit | YACAL follows the more reviewer-friendly explicit model |
| Normative artifact declaration in spec | Present | Present | Present | YACAL now declares and integrates its machine-readable artifacts in the specification itself |

## Why YACAL Has More Visible Supporting Files

At first glance YACAL can look more artifact-heavy than the peer work
products. The best explanation is that YACAL makes several layers more
explicit.

| Observation | Why it happens in YACAL | Why this is not a semantic mismatch |
|---|---|---|
| There is a separate structural schema and a separate constraint catalog | YAML needs a clear structural backbone, but many ACAL rules are not purely structural | This is the same conceptual split that already exists in XML between XSD and Schematron/assertion-style constraints |
| There are explicit composition schema examples | YACAL profile support is modular and easy to misunderstand if composition is described only in prose | These examples are implementer guidance, not extra YACAL semantics |
| The file count looks higher | YACAL keeps core, profile, identifiers, constraints, and composition examples clearly separated | The count reflects packaging clarity, not a larger language |
| The constraint file can look verbose | It records provenance, rule kind, target, and invariant in a machine-readable way | The verbosity is mostly traceability and reviewability, not extra policy semantics |

The shortest summary is:

YACAL is not more semantically complicated than XACML or JACAL. It is
simply more explicit about where each validation responsibility lives.

## Why the Structural Artifact Uses JSON Schema Semantics

This point is important because reviewers may reasonably worry that it
creates an implicit YAML-to-JSON dependency.

It does not.

The YACAL structural artifact is a JSON Schema Draft 2020-12 vocabulary
document serialized in YAML. The validated instance is the parsed YACAL
document as YAML data. This is a schema-notation choice, not a claim
that YACAL is defined through JACAL or through conversion to JSON.

The key guardrails are:

1. YAML parsing is still governed by YAML 1.2 and the YACAL prose rules
2. structural validation is performed over parsed YACAL data
3. richer constraints are handled by the separate YACAL constraint
   catalog
4. ACAL remains the abstract authority

## How to Read the Constraint Artifact

Reviewers with long XACML experience often expect richer validation to
show up as XSD assertions, Schematron, or prose guidance rather than as
a standalone YAML file. The YACAL constraint catalog should be read as
the YACAL analogue of that richer validation layer.

| If you are used to XACML thinking in terms of... | The closest YACAL equivalent is... |
|---|---|
| XSD for shape | `acal-core-yaml-v1.0-structure.schema.yaml` |
| Schematron or XSD 1.1 assertions for richer invariants | `acal-core-yaml-v1.0-constraints.yaml` |
| XML identifier files | `acal-core-yaml-v1.0-identifiers.yaml` and profile identifier artifacts |
| schema imports and extension points | profile schemas plus composition schemas |

The constraint artifact does not introduce new ACAL semantics. It
captures constraints that are already normative in ACAL and YACAL but
are awkward, undesirable, or insufficiently portable to encode purely
in the structural schema.

Examples include:

1. uniqueness by key
2. uniqueness by effective subtype
3. scoped-reference rules
4. recursive-reference and cycle rules
5. cross-property agreement rules

## Why Short Identifiers Matter More in YACAL

Short identifiers are part of ACAL generally, not unique to YACAL. They
matter more visibly in YACAL because YAML is intended to be read and
written as a human-friendly concrete representation.

| Factor | Why it matters more in YACAL |
|---|---|
| Long URIs dominate the page | YAML is sparse and line-oriented, so full identifiers visually overwhelm the policy structure very quickly |
| YAML has no namespace-prefix mechanism comparable to XML namespaces | Short identifiers give YACAL an ergonomic way to avoid repeating long URI strings everywhere |
| The promise of YAML is readability | If examples are filled with long identifiers, reviewers do not see the actual readability benefit of YACAL |
| YAML examples are often read as authoring examples, not just interchange examples | Short identifiers better represent how human-authored YACAL is expected to look in practice |

That is why YACAL examples often lead with short identifiers when doing
so improves readability.

This does not mean:

1. full identifiers are discouraged
2. YACAL depends on short identifiers
3. YACAL defines a different identifier inventory from ACAL

It means only that short identifiers are an especially important part of
making YAML readable at policy scale.

## Why Examples Often Lead with Short Identifiers

YACAL examples are trying to demonstrate the value of the representation
itself, not merely prove that any ACAL instance can be serialized in
YAML.

If examples are written mostly with full URIs, the reader sees:

1. a correct representation
2. but not a very persuasive YAML experience

If examples are written with an appropriate short-identifier set, the
reader sees:

1. the same ACAL semantics
2. the same identifier inventory
3. much clearer policy structure
4. a more realistic authoring style

In other words, leading with short identifiers is not a shortcut around
ACAL. It is a way of showing YACAL in the form where its strengths are
most visible.

## Review Guidance for ACAL Experts with Limited YAML Experience

The most useful review order is:

1. read the prose specification for the YACAL mapping and conformance
   model
2. treat the structural schema as the machine-readable shape companion
3. treat the constraint catalog as the higher-order validation
   companion
4. treat the profile artifacts as modular extensions of the core
5. treat the composition schemas as deployment examples, not as new
   syntax layers

The most important thing not to infer is that YACAL is defined through
JSON or XML. It is not.

The second most important thing not to infer is that the extra YACAL
files imply extra YACAL semantics. They do not. Most of the additional
surface area is explicit packaging of validation and composition
responsibilities that are less visible, or differently packaged, in the
peer work products.

## Bottom Line

YACAL should be reviewed as:

1. a peer ACAL concrete representation
2. a YAML-first authoring and interchange format
3. a layered work product with explicit structural, constraint,
   identifier, profile, and composition artifacts

Its artifact set is more explicit, not more semantically ambitious.
That explicitness is intentional. It is meant to make YACAL easier to
implement consistently, easier to audit, and easier to evaluate fairly
against the established XML and JSON work products.
