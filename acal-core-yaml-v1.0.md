# YAML Representation of ACAL (YACAL) Version 1.0

## Working Draft 01

## 23 March 2026

------------------------------------------------------------------------

### This version

- `acal-core-yaml-wd01-v1.0.md` (working draft source)

### Previous version

N/A

### Latest version

- `acal-core-yaml-wd01-v1.0.md` (current working draft)

### Technical Committee

OASIS eXtensible Access Control Markup Language (XACML) TC

### Chairs

- Bill Parducci (bill@parducci.net), Individual

### Secretaries

- Bill Parducci (bill@parducci.net), Individual

### Editors

- Steven Legg (steven.legg@viewds.com), ViewDS Identity Solutions
- Cyril Dangerville (cyril.dangerville@thalesgroup.com), THALES

### Additional artifacts

This work product includes the following machine-readable YACAL
artifacts.

Normative artifacts:

- `acal-core-yaml-v1.0-structure.schema.yaml` (core YACAL structural schema)
- `acal-core-yaml-v1.0-constraints.yaml` (core YACAL constraint catalog)
- `acal-core-yaml-v1.0-identifiers.yaml` (core YACAL short-identifier set)
- `acal-xpath-yaml-v1.0-structure.schema.yaml` (XPath Profile structural
  schema)
- `acal-xpath-yaml-v1.0-identifiers.yaml` (XPath Profile short-identifier
  set)
- `acal-jsonpath-yaml-v1.0-structure.schema.yaml` (JSONPath Profile
  structural schema)

Informative example artifacts:

- `yacal-root-structure-example-core-only.schema.yaml`
- `yacal-root-structure-example-using-jsonpath-profile-only.schema.yaml`
- `yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml`
- `yacal-root-structure-example-custom-plus-profile.schema.yaml`

NOTE: any machine-readable content (Computer Language Definitions)
declared Normative for this Work Product is provided in separate plain
text files.  In the event of a discrepancy between any such plain text
file and display content in the Work Product's prose narrative
document(s), the content in the separate plain text file prevails.

### Related Work

This specification is a concrete representation format for the abstract
policy language defined in [[ACAL-Core](#acal-core)].  It is a
companion to the XML and JSON concrete representations of ACAL defined
by separate specifications.

### Abstract

This document defines YACAL, a YAML-based concrete representation of the
Attribute-Centric Authorization Language (ACAL) Version 1.0 abstract
model.  YACAL specifies a mapping from every ACAL abstract model type to
a corresponding YAML structure, using YAML 1.2 block style with the
Core Schema.  YACAL is a first-class ACAL representation, parallel in
authority to the XML and JSON representations.  This specification
defines YAML syntax and YAML-specific processing rules for ACAL
constructs, together with companion machine-readable structural,
constraint, and identifier artifacts.  ACAL semantics are defined by
[[ACAL-Core](#acal-core)], not by any concrete representation.
Conversion between peer concrete representations is outside the scope of
this specification.

### Citation format

When referencing this specification the following citation format should
be used:

**[YACAL-Core-1.0]**
_ACAL v1.0 YAML Representation Profile (YACAL) Version 1.0_.
Edited by Steven Legg and Cyril Dangerville.
23 March 2026.
Working Draft 01.
`acal-core-yaml-wd01-v1.0.md`.

------------------------------------------------------------------------

## License, Document Status, and Notices

Copyright © OASIS Open 2026. All Rights Reserved.  For license,
copyright, and document-status information, see
[Annex A](#annex-a-license-document-status-and-notices).

------------------------------------------------------------------------

## Table of Contents

1. [Scope](#1-scope)
2. [Definitions and Acronyms](#2-definitions-and-acronyms)
3. [Document Conventions](#3-document-conventions)
4. [Introduction (non-normative)](#4-introduction-non-normative)
5. [Syntax (normative)](#5-syntax-normative)
6. [Safety, Security and Privacy Considerations (non-normative)](#6-safety-security-and-privacy-considerations-non-normative)
7. [Conformance](#7-conformance)

Annex A. [License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
Annex B. [References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
Annex C. [YACAL Identifiers and Machine-Readable Artifacts](#annex-c-yacal-identifiers-and-machine-readable-artifacts)
  - [C.1 Core Short-Identifier Set](#c1-core-short-identifier-set)
  - [C.2 Core YACAL Artifacts](#c2-core-yacal-artifacts)
  - [C.3 Profile YACAL Artifacts](#c3-profile-yacal-artifacts)
  - [C.4 Informative Composition Schemas](#c4-informative-composition-schemas)
Annex D. [Complete Example: Website Content Access Policy](#annex-d-complete-example-website-content-access-policy)
Annex E. [Complete Example: Healthcare Chart Access Policy](#annex-e-complete-example-healthcare-chart-access-policy)
Appendix 1. [Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Special Thanks](#special-thanks)
  - [Participants](#participants)
Appendix 2. [Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)

------------------------------------------------------------------------

## 1. Scope

This specification defines the YAML syntax of the
[[ACAL-Core](#acal-core)] model and the YAML-specific syntax and
processing rules that are not already specified by
[[ACAL-Core](#acal-core)].

YACAL is a concrete representation of ACAL.  It is a peer to the XML
and JSON ACAL representations and is not defined as a derivative of
either one.  Conversion between YACAL and other concrete
representations is outside the scope of this specification and, if
standardized, should be defined separately as interoperability
guidance.

For ACAL semantics, evaluation behavior, and abstract conformance
requirements, this specification relies on [[ACAL-Core](#acal-core)].

------------------------------------------------------------------------

## 2. Definitions and Acronyms

### 2.1 Definitions

#### 2.1.1 Terms Defined Elsewhere

ACAL
: Attribute-Centric Authorization Language Version 1.0

#### 2.1.2 Terms Defined in This Document

YACAL
: YAML Representation of ACAL Version 1.0 (this specification)

YAML mapping
: A YAML node consisting of key-value pairs

YAML sequence
: A YAML node consisting of an ordered list of values

YAML scalar
: A YAML node consisting of a single value (string, integer, float,
  boolean, or null)

wrapper key
: A mapping key whose name identifies the type of the value it
  contains; used for type discrimination in polymorphic contexts

### 2.2 Abbreviations and Acronyms

This document uses the following abbreviations and acronyms:

**ACAL**

: Attribute-Centric Authorization Language

**YACAL**

: YAML Representation of ACAL

**YAML**

: YAML Ain't Markup Language [[YAML1.2](#yaml12)]

------------------------------------------------------------------------

## 3. Document Conventions

### 3.1 Key Words

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [[RFC2119](#rfc2119)]
and [[RFC8174](#rfc8174)].

### 3.2 Typographic Conventions

YAML examples are presented in block style using code fences.  Property
names from the ACAL abstract model are rendered in `monospace`.
References to ACAL abstract model types use the form *TypeName* in
italics.

### 3.3 YAML Presentation Conventions

Unless otherwise stated, examples use YAML 1.2 block style and the Core
Schema.  Flow style MAY appear in short inline examples, but block style
is the preferred presentation form in this specification.

------------------------------------------------------------------------

## 4. Introduction (non-normative)

The Attribute-Centric Authorization Language (ACAL) Version 1.0
[[ACAL-Core](#acal-core)] defines an abstract policy language for
attribute-based access control (ABAC) decisions.  The ACAL abstract
model is independent of any concrete representation format; concrete
representations are defined by companion specifications.

YACAL defines the YAML representation of ACAL.  It is one of multiple
concrete projections of the same ACAL model.

YAML is a human-friendly data serialization language with native mapping,
sequence, and scalar constructs that suit ACAL's object structure well.
YACAL uses those constructs while preserving the semantics of the ACAL
abstract model.

### 4.1 Relationship to ACAL

YACAL is a concrete representation format for ACAL.  Every construct in
the ACAL abstract model has a corresponding YACAL representation defined
in this specification.  The normative reference for semantics,
evaluation rules, and abstract conformance requirements is
[[ACAL-Core](#acal-core)].  This specification defines how ACAL abstract
model types are expressed in YAML.

### 4.2 Relationship to Peer Representations

YACAL is structurally aligned with the other ACAL concrete
representations.  The mapping from ACAL to YACAL follows the same broad
design patterns used across the concrete representations:

-   type discrimination through wrapper mapping keys
-   polymorphic types through mutually exclusive required keys
-   ordered collections through YAML sequences
-   implicit data types for primitive values

Each concrete representation is specified independently against the ACAL
abstract model.  Transformations between concrete representations, where
needed, belong in separate interoperability guidance and do not define
YACAL conformance or semantics.

### 4.3 Design Principles

The design of YACAL is guided by the following principles, in priority
order:

1.  **Conformance**: every YACAL document MUST be conformant with the ACAL core.
    YACAL MUST NOT semantically extend the ACAL core.
2.  **Interoperability discipline**: any separate interoperability
    guidance for translating between concrete representations SHOULD
    preserve all ACAL-significant information.
3.  **Readability**: YACAL SHOULD take advantage of YAML's block style
    to improve human readability.
4.  **Consistency**: YACAL uses the same property names, type
    discrimination patterns, and structural conventions as the peer ACAL
    representations where doing so preserves YAML clarity.

------------------------------------------------------------------------

## 5. Syntax (normative)

### 5.1 YAML Baseline

#### 5.1.1 YAML Version

YACAL documents MUST conform to YAML 1.2 [[YAML1.2](#yaml12)].
YAML 1.1 features that are absent from or incompatible with YAML 1.2
(such as sexagesimal number notation, implicit date parsing, and
locale-dependent boolean values like `yes`, `no`, `on`, `off`) MUST NOT
be relied upon.

#### 5.1.2 Core Schema

YACAL documents MUST be interpreted using the YAML 1.2 Core Schema.
Under the Core Schema, the following scalar resolutions apply (depending on the matched regular expression in this order, cf. [[YAML](#yaml)] section 10.3.2):

| YAML Scalar regex | Examples | Resolved YAML Type | ACAL DataType |
|---|---|---|---|
| `null \| Null \| NULL \| ~` | `null` | null | *Not a valid ACAL value; see Section 5.4.3* |
| `true \| True \| TRUE \| false \| False \| FALSE` | `true`, `false` | Boolean | `urn:oasis:names:tc:acal:1.0:data-type:boolean` |
| `[-+]? [0-9]+` | `42`, `-7`, `0` | Integer (base 10) | `urn:oasis:names:tc:acal:1.0:data-type:integer` |
| `0o [0-7]+` | `0o7` | Integer (base 8) | *Not a valid ACAL value, see Section 5.1.4* |
| `0x [0-9a-fA-F]+` | `Ox3A` | Integer (base 16) | `urn:oasis:names:tc:acal:1.0:data-type:hexBinary` |
| `[-+]? ( \. [0-9]+ \| [0-9]+ ( \. [0-9]* )? ) ( [eE] [-+]? [0-9]+ )?` | `0.`, `-0.0`, `.5`, `+12e03`, `-2E+05` | Float (number) | `urn:oasis:names:tc:acal:1.0:data-type:double` |
| `[-+]? ( \.inf \| \.Inf \| \.INF )` | `.inf`, `-.Inf`, `+.INF` | Float (Infinity) | `urn:oasis:names:tc:acal:1.0:data-type:double` |
| `\.nan \| \.NaN \| \.NAN` | `.nan`, `.NAN` | Float (not-a-number) | `urn:oasis:names:tc:acal:1.0:data-type:double` |
| `*` (default) | `hello`, `view`, `Permit` | String | `urn:oasis:names:tc:acal:1.0:data-type:string` |

The Core Schema guarantees that unquoted scalars like `2026-03-23` are
resolved as strings (not dates), and `010` is resolved as the integer 10
(not octal 8), eliminating the type ambiguity present in YAML 1.1.

#### 5.1.3 String Quoting

YAML does not require quotes around string scalars unless the value
contains characters that would cause misinterpretation.  In YACAL:

-   **URIs MUST be quoted** (double or single quotes) because they
    contain colons, which YAML interprets as key-value separators:

    ```yaml
    # Correct:
    FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-equal"

    # Incorrect — YAML misparses at the first colon:
    FunctionId: urn:oasis:names:tc:acal:1.0:function:string-equal
    ```

-   **Short identifiers do not require quotes** because they contain
    only alphanumeric characters and hyphens:

    ```yaml
    FunctionId: string-equal
    ```

-   **Simple string values do not require quotes** when they consist
    solely of characters that are unambiguous under the Core Schema:

    ```yaml
    Value: view
    Value: clinician
    Effect: Permit
    ```

-   **String values that resemble other scalar types MUST be quoted**
    to prevent misresolution:

    ```yaml
    # The string "true", not the boolean true:
    Value: "true"

    # The string "1.0" (e.g., a version), not the float 1.0:
    Version: "1.0"

    # The string "null", not YAML null:
    Value: "null"
    ```

#### 5.1.4 Prohibited YAML Features

The following YAML features MUST NOT be used in conformant YACAL
documents:

-   **Tags** (`!!tag` or `!custom-tag`): YACAL relies on structural
    context and the Core Schema for type resolution, not tags.
-   **Anchors and aliases** (`&anchor` / `*alias`): these have no
    representation in the ACAL abstract model and would break the
    direct structural correspondence to the ACAL abstract model.
-   **Multiple documents** (`---` / `...` separators): a YACAL
    document is a single YAML document.  Bundles are expressed using
    *BundleType*, not YAML multi-document streams.
-   **Merge keys** (`<<`): a YAML 1.1 feature not part of YAML 1.2.
-   **Null** values (i.e. `null`, `Null`, `NULL`, `~` or the absence of value are considered invalid).
-   **Octal notation** for integers (to align with JSON integer type), i.e. any value matching the pattern `0o [0-7]+` is forbidden.

### 5.2 Document Structure

#### 5.2.1 Root Element

A YACAL document is a single YAML mapping with exactly one key at the
root level.  The key identifies the document type:

| Root Key | ACAL Type | Description |
|---|---|---|
| `Policy` | *PolicyType* | A single policy |
| `Bundle` | *BundleType* | A collection of policies, shared variables, and identifiers |
| `Request` | *RequestType* | An authorization decision request |
| `Response` | *ResponseType* | An authorization decision response |

Example:

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:my-first-policy"
  Version: "1.0"
  CombiningAlgId: deny-unless-permit
  CombinerInput:
    - Rule:
        Id: AllowRead
        Effect: Permit
```

#### 5.2.2 Property Names

All property names in YACAL use PascalCase, following the ACAL abstract
model property set as normalized for YAML presentation: `PolicyId`, `CombiningAlgId`,
`AttributeDesignator`, `MustBePresent`, etc.

Where an ACAL abstract property name is not already PascalCase, YACAL
normalizes it to PascalCase.  For example, the ACAL property `isBag` is
represented in YACAL as `IsBag`.

#### 5.2.3 Property Ordering

The ordering of keys within a YAML mapping is not significant for
YACAL semantics.  However, for readability and consistency, YACAL
documents SHOULD order properties in the same sequence as they appear
in the ACAL abstract model definition.

#### 5.2.4 Omitted Properties

Optional properties that are absent from a YACAL document take the
default values defined by the ACAL abstract model.  A property MUST
NOT be present with a null value (`null`, `Null`, `NULL`, `~` or undefined value in YAML) as a substitute for omission
(see [Section 5.4.3](#543-null-and-omission)).

------------------------------------------------------------------------

### 5.3 Primitive Type Mapping

#### 5.3.1 Mapping Model

This section defines the default YACAL mapping rules for ACAL primitive
types.  Unless a more specific rule applies, a primitive ACAL value is
represented as a YAML scalar.

YACAL relies on YAML 1.2 Core Schema resolution, but ACAL lexical and
value-space constraints remain normative.  Therefore, a YAML scalar is
not conformant merely because it is legal YAML; it MUST also satisfy the
constraints of the ACAL primitive type being represented.

#### 5.3.2 Primitive Types Mapped to Native YAML Scalars

The ACAL primitive types in the following table are represented using
native YAML scalar forms under the Core Schema:

| ACAL Type | YAML Form | Notes |
|---|---|---|
| `String` | YAML string scalar | Quote when required by [Section 5.1.3](#513-string-quoting) |
| `Boolean` | YAML boolean scalar | MUST use `true` or `false` |
| `Integer` | YAML integer scalar | MUST resolve as integer under the Core Schema |
| `NonNegativeInteger` | YAML integer scalar | MUST resolve as integer and be greater than or equal to zero |
| `Double` | YAML float scalar | MUST resolve as float under the Core Schema |

Examples:

```yaml
MustBePresent: true
ReturnPolicyIdList: false
MaxDelegationDepth: 3
Value: 3.14159
Description: This rule permits read access to public content.
```

A value of ACAL type `Double` MUST use a lexical form that YAML resolves
as a float rather than an integer.  For example, `3.0` and `-0.5`
represent doubles, whereas `3` represents an integer.

#### 5.3.3 Restricted String Types

Each ACAL primitive type whose value space is defined by a restricted
string lexical form is represented as a YAML string scalar that matches
the lexical constraints of that type.

Restricted string types MUST NOT use YAML tags or any YAML-specific
typing mechanism to indicate their ACAL type.  Their type is determined
by property context, wrapper context, or an explicit `DataType` property
where this specification allows one.

Examples of restricted string types include `VersionType`,
`VersionMatchType`, and `LocalIdentifierType`.

Examples:

```yaml
Version: "1.0"
Version: "2.1.3"
Version: "1.*"
Id: PermitPublicContentView
VariableId: is_admin
```

`VersionType` and `VersionMatchType` values MUST be quoted because forms
such as `1.0` would otherwise be resolved as non-string YAML scalars.

#### 5.3.4 Enumeration Types

Each ACAL enumerated type is represented as a YAML string scalar whose
value is exactly one of the lexical enumeration values defined by ACAL
or the relevant ACAL profile.

Unless quoting is required by [Section 5.1.3](#513-string-quoting),
enumeration values MAY be written as unquoted YAML strings.

Examples:

```yaml
Effect: Permit
Effect: Deny
Decision: Permit
Decision: NotApplicable
```

#### 5.3.5 Identifier-Like and URI Types

`IdentifierType`, `URI`, and similar identifier-valued primitive types
are represented as YAML string scalars.

Absolute URIs MUST be quoted:

```yaml
CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
Id: "urn:example:yacal:shared:is-business-hours"
```

Short identifiers MAY be unquoted when they are unambiguous YAML
strings:

```yaml
CombiningAlgId: deny-unless-permit
FunctionId: string-equal
```

The three ACAL identifier forms remain valid in YACAL:

1. absolute URI
2. short identifier name
3. identifier containing embedded short-identifier references

All such forms are subject to the quoting rules in
[Section 5.1.3](#513-string-quoting).

#### 5.3.6 Primitive Type Summary

The following rules summarize primitive type mapping in YACAL:

1. Primitive ACAL values are represented as YAML scalars.
2. Native YAML scalar types SHOULD be used where their Core Schema
   resolution matches the ACAL primitive type exactly.
3. Restricted strings and identifiers are represented as YAML strings,
   not as custom YAML-typed nodes.
4. Enumeration values are represented as YAML strings using the exact
   enumeration literal.
5. Quoting is a YAML presentation concern, but when needed to preserve
   the intended ACAL type, quoting is mandatory.

------------------------------------------------------------------------

### 5.4 Complex Type Mapping

#### 5.4.1 Default Mapping Rules for Complex ACAL Types

Unless a more specific rule in this specification applies, a complex
ACAL type is represented as a YAML mapping.

The following terms are used in this section:

- **concrete type**: a non-abstract ACAL type
- **abstract type**: an ACAL type that cannot be instantiated directly
- **direct position**: a context in which the property or document root
  already determines the ACAL type
- **polymorphic position**: a context in which the actual concrete type
  must be distinguished among multiple possible subtypes

The default rules are:

1. A concrete complex ACAL type in a direct position SHALL be
   represented as a YAML mapping whose keys are the ACAL property names
   of that type.
2. An abstract ACAL type has no direct standalone representation.  It
   is represented through one of its concrete subtypes according to the
   wrapper-key rules in [Section 5.4.6](#546-polymorphism-and-wrapper-key-discrimination).
3. Unless this specification says otherwise, each property appears at
   the same mapping level as its peers; YACAL does not introduce an
   extra nesting level for the ACAL type name.
4. The root document forms defined in [Section 5.2.1](#521-root-element)
   are special cases of this model in which the document type is made
   explicit by the single root key.

#### 5.4.2 Property Mapping Rules

For each property of a complex ACAL type, apply the following rules
unless a more specific type section overrides them:

1. A single-valued property is represented directly using the YAML
   representation of its ACAL type.
2. A multivalued property is represented as a YAML sequence whose items
   are the YAML representations of the property's item type.
3. If the lower bound of a property's multiplicity is `1`, the property
   MUST be present.
4. If the lower bound of a property's multiplicity is `0`, the property
   MAY be omitted.
5. If a multivalued property is present, it MUST contain at least one
   item unless a more specific rule explicitly permits an empty
   sequence.
6. If an ACAL property has a default value, that property MAY be
   omitted and the ACAL default semantics apply.  If the property is
   present, its value MUST conform to the ACAL type and any default
   constraints.
7. A YAML mapping used for a complex ACAL type MUST NOT contain duplicate
   property keys.

Examples:

```yaml
ShortIdSetReference:
  - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  - "urn:example:yacal:ids:local"

Expression:
  - Value: read
  - Value: write
```

#### 5.4.3 Null and Omission

The YAML scalars `null`, `Null`, `NULL` and `~` are not valid YACAL values and MUST NOT be used as a generic
stand-in for absence. Similarly, a property with undefined value (e.g. `myProperty: # Empty`) is forbidden in YACAL.

To omit an optional property, the property MUST simply be absent from
the mapping.  An omitted property is not equivalent to a present
property whose value is YAML `null`.

#### 5.4.4 ValueType Mapping Rules

The ACAL `ValueType` and its literal subtypes are mapped specially
because YAML provides native scalar forms.

`ValueType` is abstract.  In YACAL, its concrete representations follow
the same conceptual split as ACAL:

1. fixed-datatype primitive values
2. restricted-string primitive values
3. structured values

Unless a more specific parent-context rule applies, a `ValueType` is
represented in one of the following forms:

1. as a YAML scalar when the ACAL data type is implicit from the Core
   Schema resolution or from the surrounding ACAL context
2. as a YAML mapping containing `DataType` and `Value` when the data
   type is not implicit or when an explicit `DataType` is required for
   unambiguous interpretation
3. as a YAML mapping containing `DataType` and profile-defined
   structured-value properties, as defined in
   [Section 5.4.5](#545-structuredvaluetype-mapping)

The following rules apply to primitive `ValueType` forms:

1. A YAML boolean scalar represents `LiteralBooleanType`.  Its ACAL
   `DataType` is fixed to
   `urn:oasis:names:tc:acal:1.0:data-type:boolean`.
2. A YAML integer scalar represents `LiteralIntegerType`.  Its ACAL
   `DataType` is fixed to
   `urn:oasis:names:tc:acal:1.0:data-type:integer`.
3. A YAML float scalar represents `LiteralDoubleType`.  Its ACAL
   `DataType` is fixed to
   `urn:oasis:names:tc:acal:1.0:data-type:double`.
4. A YAML string scalar represents either:
   1. `LiteralStringType`, if no inherited or explicit non-string
      `DataType` applies
   2. `LiteralRestrictedStringType`, if an inherited or explicit
      non-string lexical `DataType` applies
5. If a fixed-datatype primitive value is accompanied by an explicit
   `DataType`, that `DataType` MUST match the fixed data type of the
   scalar and SHOULD be omitted.
6. If a YAML string scalar is used with an explicit or inherited
   `DataType`, that string MUST satisfy the lexical constraints of the
   effective ACAL data type.

Primitive implicit examples:

```yaml
# Boolean — implicit DataType: boolean
Value: true

# Integer — implicit DataType: integer
Value: 42

# Double — implicit DataType: double
Value: 3.14

# String — implicit DataType: string
Value: view
```

When a string resembles another YAML scalar type, it MUST be quoted:

```yaml
Value: "true"
Value: "1.0"
```

When the data type is not implicit from either YAML scalar resolution or
the surrounding ACAL context, explicit typing is required:

```yaml
DataType: "urn:oasis:names:tc:acal:1.0:data-type:date"
Value: "2026-03-23"
```

The ACAL `DataType` of a `ValueType` is determined by the following
precedence:

1. the fixed data type of the concrete literal subtype, if any
2. an explicit `DataType` in the `ValueType` mapping
3. a parent-context inference rule defined by ACAL for the containing
   object or expression
4. the ACAL default of string, if no other rule determines the data type

If an enclosing ACAL object already fixes or infers the `DataType` of
the value, the nested `ValueType` SHOULD omit its own `DataType`.  If
both the enclosing context and the nested `ValueType` specify a
`DataType`, the two values MUST agree.

Typical parent contexts that may fix or infer the `DataType` of a
contained `ValueType` include:

- typed attribute-value containers
- `ParameterType` default expressions
- `ApplyType` arguments whose function signature fixes the expected type
- `PolicyReferenceType` and `SharedVariableReferenceType` arguments
- quantified-expression rules defined by ACAL for the `Iterant`
- other ACAL parent objects whose sections define a `DataType`
  inference rule

Examples of inherited `DataType`:

```yaml
RequestAttribute:
  - AttributeId: "urn:example:yacal:subject:role"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - clinician

Parameter:
  - Name: threshold
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:integer"
    Expression:
      Value: 10000
```

In both examples above, the nested value SHOULD omit its own `DataType`
because the surrounding context already fixes it.

#### 5.4.5 StructuredValueType Mapping

`StructuredValueType` is an abstract form of `ValueType` used for
profile-defined structured values.  A concrete `StructuredValueType`
subtype is represented as a YAML mapping containing the
profile-defined properties of that subtype.

When a structured value is used in expression position, that mapping is
the value associated with the `Value` wrapper key; YACAL does not add an
extra wrapper for the concrete structured subtype unless the relevant
profile explicitly defines one.

If the surrounding context does not already determine the ACAL data
type, the representation MUST include a `DataType` property identifying
the structured value's data type.

If the surrounding context already determines the `DataType`, the
structured value MAY be represented by its profile-defined properties
without repeating `DataType`.

A concrete structured-value subtype MUST NOT redefine `DataType` with a
conflicting meaning or create ambiguity between the core `DataType`
property and profile-defined properties.

Examples:

```yaml
Value:
  DataType: "urn:example:yacal:data-type:structured-example"
  FieldA: alpha
  FieldB: 3
```

```yaml
RequestAttribute:
  - AttributeId: "urn:example:yacal:resource:structured-attribute"
    DataType: "urn:example:yacal:data-type:structured-example"
    Value:
      - FieldA: alpha
        FieldB: 3
```

#### 5.4.6 Polymorphism and Wrapper-Key Discrimination

When a value is in a polymorphic position, YACAL represents it as a YAML
mapping with exactly one wrapper key.

The wrapper key identifies the concrete subtype, and the corresponding
value is the direct YAML representation of that subtype.

The following rules apply:

1. Exactly one wrapper key MUST be present.
2. A mapping with zero wrapper keys in a polymorphic position is
   invalid.
3. A mapping with more than one wrapper key in a polymorphic position is
   invalid.
4. The wrapper key names are those assigned by this specification for
   the relevant polymorphic context.
5. The value associated with the wrapper key MUST conform to the direct
   representation rules of the identified subtype.
6. No additional sibling keys are permitted alongside the wrapper key in
   the same polymorphic wrapper mapping.
7. In a sequence of polymorphic values, each sequence item is wrapped
   independently.
8. A wrapper key identifies the concrete subtype used in that context,
   not each intermediate abstract supertype in the inheritance chain.

Examples:

```yaml
Expression:
  Apply:
    FunctionId: string-equal

CombinerInput:
  - Rule:
      Id: AllowRead
      Effect: Permit
```

#### 5.4.7 Inheritance and Subtype Resolution

ACAL inheritance affects which properties a subtype carries, but it does
not require nested YAML wrappers for each inheritance layer.

When a concrete subtype inherits properties from one or more supertypes,
the YAML representation of the subtype includes all inherited
properties, together with the subtype's own properties, in one mapping
unless a more specific section of this specification states otherwise.

Subtype resolution follows these rules:

1. In a direct position, the surrounding property or document context
   determines the expected ACAL type.
2. In a polymorphic position, the wrapper key determines the concrete
   subtype.
3. If a concrete non-final type is itself permitted in a polymorphic
   position, that direct use is identified by the wrapper key assigned
   to that concrete type in the relevant context.
4. Abstract supertypes may contribute inherited properties and
   constraints, but they do not appear as separate YAML wrapper layers
   unless they are themselves the polymorphic discriminator in a
   context-specific rule.
5. If a subtype overrides or specializes a property inherited from a
   supertype, the YAML representation follows the effective ACAL subtype
   definition for that property.

Examples of this flattening include:

- `EntityAttributeDesignatorType`, which inherits common named-attribute
  designator properties without introducing a separate
  `NamedAttributeDesignator` wrapper
- `PolicyType` and `RuleType`, which can appear as concrete
  `CombinerInputType` subtypes in polymorphic positions but use their
  direct property mappings in non-polymorphic positions

#### 5.4.8 Extensible Abstract Types

Some abstract ACAL types are designed to be extended by ACAL profiles
or by implementation-defined profile-compatible subtypes.  YACAL uses
the same wrapper-key and inheritance model for these extensions.

The generic rules are:

1. A profile-defined concrete subtype of an abstract ACAL type SHALL use
   the inherited-property flattening model of
   [Section 5.4.7](#547-inheritance-and-subtype-resolution).
2. In a polymorphic position, a profile-defined concrete subtype SHALL
   be identified by the wrapper key assigned by the relevant profile
   specification.
3. In a direct position created by a profile-specific property whose
   type is already fixed to that concrete subtype, no extra polymorphic
   wrapper is required unless the profile says otherwise.
4. This specification does not assign wrapper keys to profile-defined
   subtypes unless they are part of the YACAL core vocabulary.

Important examples of extensible abstract types in ACAL include:

- `PolicyDefaultsType`
- `RequestDefaultsType`
- `StructuredValueType`
- `AttributeSelectorType`
- `EntityAttributeSelectorType`

#### 5.4.9 Ordering and Presentation Rules

Within a YAML mapping, property ordering is not semantically
significant.  Within a YAML sequence, item ordering is preserved.

Sequence order is semantically significant where ACAL defines ordered
evaluation or ordered collections.  Where ACAL does not assign semantic
meaning to ordering, processors MUST preserve the sequence as given but
need not treat the order as semantically relevant.

#### 5.4.10 AnyType Mapping

`AnyType` is used where ACAL permits representation-defined or
profile-defined arbitrary content, notably in `ContentType` and
`StatusDetailType`.

In YACAL, an `AnyType` value is represented directly as a YAML node
without any extra wrapper:

1. a YAML mapping for structured object content
2. a YAML sequence for structured list content
3. a YAML scalar for textual or scalar payloads

The chosen YAML form MUST be consistent with the enclosing ACAL object,
its `MediaType`, any `Encoding`, and any applicable ACAL profile.

If the content is XML or another non-YAML-native textual format, the
`AnyType` value SHOULD be represented as a YAML string, typically quoted
or block-scalar style.

YAML tags, anchors, aliases, merge keys, and multi-document streams are
prohibited in `AnyType` content just as they are elsewhere in YACAL.

#### 5.4.11 ContentType Mapping

`ContentType` is represented as a YAML mapping with the following
properties:

| Property | Required | Type | Notes |
|---|---|---|---|
| `MediaType` | No | String | Media type of the content body. If omitted, the default value `application/yaml` applies, and the `Body` SHALL be a YAML 1.2 document. The values `application/json` and `application/xml` SHALL be used for JSON objects and XML documents respectively.  |
| `Encoding` | No | String | Content encoding, used only when the `Body` string is encoded rather than directly represented. The Encoding value `base64` indicates that the Body is Base64-encoded as per [[RFC4648](#rfc4648)]. Other Encoding values may be defined by other YACAL Profiles. |
| `Body` | Yes | *AnyType* | Direct representation of the content payload |

The `Body` value is the direct YACAL representation of the underlying
content and follows the rules in
[Section 5.4.10](#5410-anytype-mapping).

For structured content that is naturally represented using YAML
mappings, sequences, or scalars, the `Body` SHOULD normally use those
native YAML forms:

```yaml
Content:
  Body:
    patient:
      id: "P-12345"
      ward: cardiology
```

For XML, JSON or other textual structured content, the `Body` SHOULD normally
be represented as a YAML string.  If encoded binary or escaped textual
content is required, the `Encoding` property identifies that encoding:


```yaml
Content:
  MediaType: "application/json"
  Body: |
    { "patient": { 
        "id": "P-12345",
        "ward": "cardiology"
      }
    }
```

```yaml
Content:
  MediaType: "application/xml"
  Body: |
    <record id="P-12345"><ward>cardiology</ward></record>
```

```yaml
Content:
  MediaType: "application/xml"
  Encoding: base64
  Body: "PHJlY29yZCBpZD0iUC0xMjM0NSI+PHdhcmQ+Y2FyZGlvbG9neTwvd2FyZD48L3JlY29yZD4="
```

Processors MAY reject unsupported media types, unsupported encodings, or
profile-specific content forms they do not claim to implement.

#### 5.4.12 AttributeType Mapping

`AttributeType` is the reusable ACAL form for an identified attribute
with one or more values.  In YACAL, it is represented as a YAML mapping:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `AttributeId` | Yes | — | *IdentifierType* | 1 |
| `Issuer` | No | — | Name | 0..1 |
| `DataType` | No | string | *IdentifierType* | 0..1 |
| `Value` | Yes | — | *ValueType* | 1..* |

The `Value` property is represented as a YAML sequence, each item being
the direct representation of a `ValueType`.

If the enclosing `AttributeType` mapping specifies `DataType`, each
nested `Value` SHOULD omit its own `DataType`; if a nested value does
specify one, it MUST agree with the enclosing `DataType`.

Example:

```yaml
Attribute:
  AttributeId: "urn:example:yacal:resource:classification"
  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
  Value:
    - confidential
    - restricted
```

Subtypes of `AttributeType`, such as `RequestAttributeType` and
`AttributeAssignmentType`, inherit this mapping and add their own
properties in the same YAML mapping.

#### 5.4.13 EntityType Mapping

`EntityType` is the reusable ACAL form for entity-valued content, such
as `PolicyIssuer`.

In YACAL, it is represented as a YAML mapping with the following
properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Content` | No | *ContentType* | 0..1 |
| `Attribute` | No | *AttributeType* | * |

At least one of `Content` or `Attribute` MUST be present.

Example:

```yaml
PolicyIssuer:
  Attribute:
    - AttributeId: "urn:example:yacal:issuer:id"
      Value:
        - "urn:example:authority:cardiology-board"
```

`EntityType` uses `ContentType` according to
[Section 5.4.11](#5411-contenttype-mapping) and `AttributeType`
according to [Section 5.4.12](#5412-attributetype-mapping).

#### 5.4.14 Common Scalar Property Conventions

Some ACAL properties recur across many YACAL objects and do not require
their own wrapper or container syntax.

The following conventions apply wherever those properties appear:

- `Category` is represented as an `IdentifierType` YAML scalar
- `Description` is represented as a YAML string scalar
- both properties follow the general primitive-type and quoting rules in
  [Section 5.3](#53-primitive-type-mapping)

------------------------------------------------------------------------

### 5.5 Expression Representation

#### 5.5.1 ExpressionType

ACAL *ExpressionType* is an abstract polymorphic type.  In YACAL, it is
represented as a YAML mapping with exactly one key that identifies the
expression subtype, following the generic wrapper-key rules in
[Section 5.4.6](#546-polymorphism-and-wrapper-key-discrimination):

Intermediate abstract supertypes such as `NonLiteralExpressionType`,
`NamedAttributeDesignatorType`, and `QuantifiedExpressionType` do not
introduce additional wrapper levels.  The wrapper key identifies the
usable concrete subtype in the expression position.

| Wrapper Key | ACAL Type |
|---|---|
| `Apply` | *ApplyType* |
| `AttributeDesignator` | *AttributeDesignatorType* |
| `EntityAttributeDesignator` | *EntityAttributeDesignatorType* |
| `AttributeSelector` | *AttributeSelectorType* (optional) |
| `EntityAttributeSelector` | *EntityAttributeSelectorType* (optional) |
| `VariableReference` | *VariableReferenceType* |
| `SharedVariableReference` | *SharedVariableReferenceType* |
| `Function` | *FunctionType* |
| `Value` | *ValueType* |
| `ForAny` | *ForAnyType* (optional) |
| `ForAll` | *ForAllType* (optional) |
| `Select` | *SelectType* (optional) |
| `Map` | *MapType* (optional) |

#### 5.5.2 ApplyType

*ApplyType* represents a function application with arguments:

```yaml
Apply:
  FunctionId: string-is-in
  Expression:
    - Value: view
    - AttributeDesignator:
        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
        MustBePresent: true
```

Properties:

| Property | Required | Type | Notes |
|---|---|---|---|
| `FunctionId` | Yes | *IdentifierType* | Function identifier |
| `Description` | No | String | Free-form description |
| `Expression` | No | Sequence of *ExpressionType* | Arguments in order; empty if function takes no arguments. When the function signature fixes an argument `DataType`, a statically typed child expression such as `Value` SHOULD omit `DataType`; if present, it MUST agree with the function signature |

#### 5.5.3 AttributeDesignatorType

*AttributeDesignatorType* retrieves attribute values from the request
context:

```yaml
AttributeDesignator:
  Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
  AttributeId: "urn:example:yacal:subject:role"
  MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Notes |
|---|---|---|---|---|
| `Category` | Yes | — | *IdentifierType* | Attribute category |
| `AttributeId` | Yes | — | *IdentifierType* | Attribute identifier |
| `DataType` | No | string | *IdentifierType* | Data type of returned values; subject to inference rules |
| `Issuer` | No | — | Name | Attribute issuer |
| `MustBePresent` | No | `false` | Boolean | If `true`, missing attribute returns Indeterminate |

#### 5.5.4 EntityAttributeDesignatorType

```yaml
EntityAttributeDesignator:
  AttributeId: "urn:example:yacal:entity:name"
  MustBePresent: true
  Expression:
    VariableReference:
      VariableId: current_entity
```

Properties are inherited from *NamedAttributeDesignatorType* with the
addition of `Expression` (required, *ExpressionType*) instead of
`Category`.  The inherited properties appear in the same mapping; YACAL
does not introduce a separate `NamedAttributeDesignator` wrapper layer.

#### 5.5.5 VariableReferenceType

```yaml
VariableReference:
  VariableId: is_admin
```

#### 5.5.6 SharedVariableReferenceType

```yaml
SharedVariableReference:
  Id: "urn:example:yacal:shared:is-local-timezone"
  Version: "1.*"
  Expression:
    - Value: "America/Los_Angeles"
```

Each item in `Expression` corresponds positionally to a `Parameter`
definition in the referenced shared variable.  Where the referenced
parameter fixes the `DataType`, a nested `ValueType` SHOULD omit
`DataType`; if present, it MUST agree.

#### 5.5.7 FunctionType

*FunctionType* appears as an argument to higher-order functions:

```yaml
Function:
  Id: string-equal
```

#### 5.5.8 QuantifiedExpressionTypes

*ForAny*, *ForAll*, *Select*, and *Map* share a common structure:

```yaml
ForAny:
  VariableId: role
  Domain:
    AttributeDesignator:
      Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      AttributeId: "urn:example:yacal:subject:roles"
      MustBePresent: true
  Iterant:
    Apply:
      FunctionId: string-equal
      Expression:
        - VariableReference:
            VariableId: role
        - Value: admin
```

Properties:

| Property | Required | Type | Notes |
|---|---|---|---|
| `VariableId` | Yes | *LocalIdentifierType* | Quantified variable identifier |
| `Domain` | Yes | *NonLiteralExpressionType* | Expression evaluating to a bag |
| `Iterant` | Yes | *ExpressionType* | Expression evaluated per domain value |

These are concrete subtypes of the abstract
*QuantifiedExpressionType*.  In polymorphic expression position, the
wrapper key identifies which quantified subtype is in use; the common
inherited properties then appear directly within that subtype's mapping.

#### 5.5.9 BooleanExpressionType

*BooleanExpressionType* (used by `Target` and `Condition`) is
represented directly as the contained expression, not as a separate
wrapper.  The expression MUST NOT be a literal *ValueType*:

```yaml
Condition:
  Apply:
    FunctionId: string-is-in
    Expression:
      - Value: read
      - AttributeDesignator:
          Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
          AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          MustBePresent: true
```

#### 5.5.10 AttributeSelectorType

`AttributeSelectorType` is an optional, profile-defined expression form.
In YACAL it uses the `AttributeSelector` wrapper key from
[Section 5.5.1](#551-expressiontype).

The direct mapping of a concrete attribute-selector subtype includes the
base-selector properties plus the `Category` property:

| Property | Required | Default | Type | Notes |
|---|---|---|---|---|
| `Path` | Yes | — | String | Profile-defined path expression syntax |
| `DataType` | No | string or inferred | *IdentifierType* | Expected data type of selected values |
| `MustBePresent` | No | `false` | Boolean | Missing or empty selection handling |
| `Category` | Yes | — | *IdentifierType* | Request entity category whose `Content` is queried |

Illustrative form:

```yaml
AttributeSelector:
  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
  Path: "PATH-EXPR"
  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
  MustBePresent: true
```

The concrete syntax and semantics of `Path`, and any additional
selector-specific properties, are defined by the relevant ACAL profile.

#### 5.5.11 EntityAttributeSelectorType

`EntityAttributeSelectorType` is an optional, profile-defined expression
form.  In YACAL it uses the `EntityAttributeSelector` wrapper key from
[Section 5.5.1](#551-expressiontype).

Its direct mapping includes the base-selector properties plus the
required `Expression` property:

| Property | Required | Default | Type | Notes |
|---|---|---|---|---|
| `Path` | Yes | — | String | Profile-defined path expression syntax |
| `DataType` | No | string or inferred | *IdentifierType* | Expected data type of selected values |
| `MustBePresent` | No | `false` | Boolean | Missing or empty selection handling |
| `Expression` | Yes | — | *ExpressionType* | Evaluates to an entity value or category URI |

Illustrative form:

```yaml
EntityAttributeSelector:
  Path: "PATH-EXPR"
  MustBePresent: true
  Expression:
    VariableReference:
      VariableId: current_entity
```

The selector `Expression` MUST evaluate to either an entity value or a
category URI, as defined by ACAL and the relevant selector profile.

------------------------------------------------------------------------

### 5.6 Policy and Rule Representation

#### 5.6.1 PolicyType

A complete policy example:

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:content-access"
  Version: "1.0"
  Description: Permits view access to public content.
  CombiningAlgId: deny-unless-permit
  ShortIdSetReference:
    - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  VariableDefinition:
    - VariableId: action_is_view
      Expression:
        Apply:
          FunctionId: string-is-in
          Expression:
            - Value: view
            - AttributeDesignator:
                Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                MustBePresent: true
  CombinerInput:
    - Rule:
        Id: PermitPublicView
        Effect: Permit
        Condition:
          Apply:
            FunctionId: and
            Expression:
              - VariableReference:
                  VariableId: action_is_view
              - Apply:
                  FunctionId: string-is-in
                  Expression:
                    - Value: public
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:visibility"
                        MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `PolicyId` | Yes | — | URI | 1 |
| `Version` | Yes | — | *VersionType* | 1 |
| `CombiningAlgId` | Yes | — | *IdentifierType* | 1 |
| `Description` | No | — | String | 0..1 |
| `ShortIdSetReference` | No | — | URI | * |
| `MaxDelegationDepth` | No | — | NonNegativeInteger | 0..1 |
| `PolicyIssuer` | No | — | *EntityType* | 0..1 |
| `PolicyDefaults` | No | — | *PolicyDefaultsType* | * |
| `Parameter` | No | — | *ParameterType* | * |
| `VariableDefinition` | No | — | *VariableDefinitionType* | * |
| `Target` | No | *(applies to all)* | *BooleanExpressionType* | 0..1 |
| `NoticeExpression` | No | — | *NoticeExpressionType* | * |
| `CombinerInput` | No | — | *CombinerInputType* | * |

`PolicyType` is also a concrete subtype of *CombinerInputType*.  When
it appears in a direct position such as the document root or the
`Bundle.Policy` property, it uses its direct mapping.  When it appears
within the polymorphic `CombinerInput` property, it is identified by
the `Policy` wrapper key.

`PolicyDefaultsType` is an abstract extensible type.  Each item in the
`PolicyDefaults` sequence therefore uses the concrete subtype defined by
the relevant ACAL profile, following the generic rules in
[Section 5.4.8](#548-extensible-abstract-types).

#### 5.6.2 RuleType

```yaml
Rule:
  Id: PermitClinicianRead
  Effect: Permit
  Description: Permits clinicians to read medical records.
  Condition:
    Apply:
      FunctionId: and
      Expression:
        - Apply:
            FunctionId: string-is-in
            Expression:
              - Value: clinician
              - AttributeDesignator:
                  Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                  AttributeId: "urn:example:yacal:subject:role"
                  MustBePresent: true
        - Apply:
            FunctionId: string-is-in
            Expression:
              - Value: medical-record
              - AttributeDesignator:
                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                  AttributeId: "urn:example:yacal:resource:type"
                  MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `Id` | Yes | — | *LocalIdentifierType* | 1 |
| `Effect` | Yes | — | *EffectType* | 1 |
| `Description` | No | — | String | 0..1 |
| `VariableDefinition` | No | — | *VariableDefinitionType* | * |
| `Condition` | No | *(always satisfied)* | *BooleanExpressionType* | 0..1 |
| `NoticeExpression` | No | — | *NoticeExpressionType* | * |

#### 5.6.3 CombinerInputType

*CombinerInputType* is a polymorphic container.  Each element in the
`CombinerInput` sequence is a YAML mapping with exactly one key
identifying the input type, following the generic rules in
[Section 5.4.6](#546-polymorphism-and-wrapper-key-discrimination):

```yaml
CombinerInput:
  - Rule:
      Id: AllowRead
      Effect: Permit
  - Rule:
      Id: DenyWrite
      Effect: Deny
  - PolicyReference:
      Id: "urn:example:yacal:policy:audit-logging"
      Version: "1.*"
  - Policy:
      PolicyId: "urn:example:yacal:policy:nested-check"
      Version: "1.0"
      CombiningAlgId: first-applicable
      CombinerInput:
        - Rule:
            Id: InnerRule
            Effect: Permit
```

Valid wrapper keys: `Rule`, `Policy`, `PolicyReference`.

`RuleType`, `PolicyType`, and `PolicyReferenceType` therefore have two
different presentation contexts in YACAL:

1. direct use, where the surrounding property already fixes the type
2. polymorphic combiner use, where the wrapper key identifies the type

#### 5.6.4 VariableDefinitionType

```yaml
VariableDefinition:
  - VariableId: is_admin
    Expression:
      Apply:
        FunctionId: string-is-in
        Expression:
          - Value: admin
          - AttributeDesignator:
              Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
              AttributeId: "urn:example:yacal:subject:role"
              MustBePresent: true
```

If the `Expression` is a literal `ValueType` and neither the value nor
its parent context fixes a `DataType`, it is treated as string by
default.

#### 5.6.5 ParameterType

```yaml
Parameter:
  - Name: threshold
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:integer"
    IsBag: false
    Description: Approval threshold amount.
    Expression:
      Value: 10000
```

If the `Expression` is a `ValueType`, it SHOULD omit any nested
`DataType` because the surrounding `ParameterType` already fixes the
value's `DataType`.  If both are present, they MUST agree.

#### 5.6.6 PolicyReferenceType

```yaml
PolicyReference:
  Id: "urn:example:yacal:policy:audit-logging"
  Version: "2.*"
  Expression:
    - Value: "high"
    - Value: 90
```

Each item in `Expression` corresponds positionally to a `Parameter`
definition in the referenced policy.  Where the referenced parameter
fixes the `DataType`, a nested `ValueType` SHOULD omit `DataType`; if
present, it MUST agree.

#### 5.6.7 PolicyIssuer

The `PolicyIssuer` property of a `PolicyType` value uses the direct
mapping of `EntityType` from [Section 5.4.13](#5413-entitytype-mapping).

Example:

```yaml
PolicyIssuer:
  Attribute:
    - AttributeId: "urn:example:yacal:issuer:id"
      Value:
        - "urn:example:authority:medical-board"
    - AttributeId: "urn:example:yacal:issuer:name"
      Value:
        - "Regional Medical Board"
```

If `PolicyIssuer` includes structured body content, that content follows
the `ContentType` rules in [Section 5.4.11](#5411-contenttype-mapping).

#### 5.6.8 PolicyPatternMatchReference

For conformance-table alignment with the peer representations, YACAL
uses the name `PolicyPatternMatchReference` for the direct YAML mapping
of ACAL `PatternMatchIdReferenceType` when it is used as a policy
reference without parameters.

It is represented as a YAML mapping with:

| Property | Required | Type | Notes |
|---|---|---|---|
| `Id` | Yes | URI | Identifier of the referenced policy |
| `Version` | No | *VersionMatchType* | Matching expression for acceptable versions |

Example:

```yaml
PolicyPatternMatchReference:
  Id: "urn:example:yacal:policy:audit-logging"
  Version: "2.*"
```

If parameter expressions are required, the `PolicyReferenceType`
representation in [Section 5.6.6](#566-policyreferencetype) is used
instead.

#### 5.6.9 PolicyDefaultsType

`PolicyDefaultsType` is an optional abstract extension point.  ACAL core
defines no concrete `PolicyDefaultsType` subtype, so YACAL core defines
no fixed child properties for it.

In YACAL, the `PolicyDefaults` property of a `PolicyType` value is a
sequence of concrete profile-defined default objects.  Each item uses
the direct mapping of the relevant concrete subtype, following the
generic extension rules in
[Section 5.4.8](#548-extensible-abstract-types).

A profile that defines a concrete `PolicyDefaultsType` subtype MUST
define:

1. the subtype's YACAL property set
2. whether any profile-specific wrapper key is used
3. any profile-specific constraints and defaults

YACAL core itself does not assign a core wrapper key or core property
set for `PolicyDefaultsType`.

------------------------------------------------------------------------

### 5.7 Bundle Representation

#### 5.7.1 BundleType

```yaml
Bundle:
  ShortIdSet:
    - Id: "urn:example:yacal:ids:common"
      ShortIdSetReference:
        - "urn:oasis:names:tc:acal:1.0:core:identifiers"
      ShortId:
        - Name: subject-role
          Value: "urn:example:yacal:subject:role"
        - Name: resource-type
          Value: "urn:example:yacal:resource:type"

  SharedVariableDefinition:
    - Id: "urn:example:yacal:shared:is-business-hours"
      Version: "1.0"
      Description: Returns true during business hours.
      Expression:
        Apply:
          FunctionId: and
          Expression:
            - Apply:
                FunctionId: integer-greater-than-or-equal
                Expression:
                  - Apply:
                      FunctionId: time-hour-from-time
                      Expression:
                        - Apply:
                            FunctionId: time-one-and-only
                            Expression:
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:environment"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:environment:current-time"
                                  MustBePresent: true
                  - Value: 9
            - Apply:
                FunctionId: integer-less-than
                Expression:
                  - Apply:
                      FunctionId: time-hour-from-time
                      Expression:
                        - Apply:
                            FunctionId: time-one-and-only
                            Expression:
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:environment"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:environment:current-time"
                                  MustBePresent: true
                  - Value: 17

  Policy:
    - PolicyId: "urn:example:yacal:policy:office-access"
      Version: "1.0"
      CombiningAlgId: deny-unless-permit
      ShortIdSetReference:
        - "urn:example:yacal:ids:common"
      CombinerInput:
        - Rule:
            Id: PermitDuringBusinessHours
            Effect: Permit
            Condition:
              SharedVariableReference:
                Id: "urn:example:yacal:shared:is-business-hours"

  PolicyReference:
    Id: "urn:example:yacal:policy:office-access"
    Version: "1.0"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `ShortIdSet` | No | *ShortIdSetType* | * |
| `SharedVariableDefinition` | No | *SharedVariableDefinitionType* | * |
| `Policy` | No | *PolicyType* | * |
| `PolicyReference` | No | *PolicyReferenceType* | 0..1 |

If `PolicyReference` is present, the `Policy` sequence MUST NOT be
empty.

#### 5.7.2 SharedVariableDefinitionType

```yaml
SharedVariableDefinition:
  - Id: "urn:example:yacal:shared:is-local-timezone"
    Version: "1.0"
    Description: >
      Returns true when the environment timezone matches the
      specified timezone parameter.
    Parameter:
      - Name: timezone
        DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        Expression:
          Value: "America/New_York"
    Expression:
      Apply:
        FunctionId: string-is-in
        Expression:
          - VariableReference:
              VariableId: timezone
          - AttributeDesignator:
              Category: "urn:oasis:names:tc:acal:1.0:attribute-category:environment"
              AttributeId: "urn:example:yacal:environment:timezone"
              MustBePresent: true
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | URI | 1 |
| `Version` | Yes | *VersionType* | 1 |
| `Description` | No | String | 0..1 |
| `ShortIdSetReference` | No | URI | * |
| `Parameter` | No | *ParameterType* | * |
| `Expression` | Yes | *ExpressionType* | 1 |

`SharedVariableDefinitionType` objects exist at bundle scope rather than
policy scope.  Their `Expression` MAY contain
`SharedVariableReferenceType` objects referring to other shared
variables, but it MUST NOT create direct or indirect recursive shared
variable dependencies.

Because the `SharedVariableDefinitionType` object is not within the
scope of any `VariableDefinitionType`, its expression SHALL NOT contain
`VariableReferenceType` objects.

------------------------------------------------------------------------

### 5.8 Request and Response Representation

#### 5.8.1 RequestType

```yaml
Request:
  ReturnPolicyIdList: false
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:example:yacal:subject:role"
          Value:
            - clinician
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          Value:
            - read
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:example:yacal:resource:type"
          Value:
            - medical-record
        - AttributeId: "urn:example:yacal:resource:patient-id"
          Value:
            - "P-12345"
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `ReturnPolicyIdList` | No | `false` | Boolean | 0..1 |
| `CombinedDecision` | No | `false` | Boolean | 0..1 |
| `ShortIdSetReference` | No | — | URI | * |
| `RequestDefaults` | No | — | *RequestDefaultsType* | * |
| `RequestEntity` | Yes | — | *RequestEntityType* | 1..* |
| `MultiRequests` | No | — | *MultiRequestsType* | 0..1 |

`RequestDefaultsType` is an abstract extensible type.  Each item in the
`RequestDefaults` sequence therefore uses the concrete subtype defined
by the relevant ACAL profile, following the generic rules in
[Section 5.4.8](#548-extensible-abstract-types).

If `RequestEntity.Id` values are present, they MUST be unique within the
enclosing request.  These identifiers are the targets of
`RequestEntityReferenceType` when the optional multi-request feature is
used.

#### 5.8.2 RequestEntityType

```yaml
Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
Id: subject-entity-1
Content:
  Body:
    name: Alice
    department: Engineering
RequestAttribute:
  - AttributeId: "urn:example:yacal:subject:role"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - clinician
    IncludeInResult: false
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Category` | Yes | *IdentifierType* | 1 |
| `Id` | No | *LocalIdentifierType* | 0..1 |
| `Content` | No | *ContentType* | 0..1 |
| `RequestAttribute` | No | *RequestAttributeType* | * |

`Content`, if present, follows the generic mapping rules in
[Section 5.4.11](#5411-contenttype-mapping).

Each `RequestAttribute` item uses the mapping in
[Section 5.8.3](#583-requestattributetype).

Unless the optional multi-request feature is in use, processors SHOULD
reject multiple `RequestEntity` objects in the same request with the
same `Category` value.

#### 5.8.3 RequestAttributeType

```yaml
RequestAttribute:
  - AttributeId: "urn:example:yacal:subject:role"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - clinician
      - attending
    IncludeInResult: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `AttributeId` | Yes | — | *IdentifierType* | 1 |
| `Issuer` | No | — | Name | 0..1 |
| `DataType` | No | string | *IdentifierType* | 0..1 |
| `Value` | Yes | — | *ValueType* | 1..* |
| `IncludeInResult` | No | `false` | Boolean | 0..1 |

`RequestAttributeType` extends `AttributeType` with
`IncludeInResult`.  The inherited `Value` sequence follows
[Section 5.4.12](#5412-attributetype-mapping); if the enclosing
attribute defines `DataType`, nested values SHOULD omit their own
`DataType`.

#### 5.8.4 MultiRequestsType

```yaml
MultiRequests:
  RequestReference:
    - RequestEntityReference:
        - Id: subject-entity-1
        - Id: action-entity-1
        - Id: resource-entity-1
    - RequestEntityReference:
        - Id: subject-entity-2
        - Id: action-entity-1
        - Id: resource-entity-1
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `RequestReference` | Yes | *RequestReferenceType* | 1..* |

Each `RequestReference` value identifies one request instance by naming
the `RequestEntity` values from the enclosing `Request`.

The set of referenced entity identifiers in each `RequestReference`
MUST be unique within the enclosing `MultiRequests` value.

If a processor does not implement this optional feature but encounters a
`MultiRequests` value, it MUST treat the request as using an unsupported
optional feature and fail in a manner consistent with ACAL response
rules.

#### 5.8.5 RequestReferenceType

```yaml
RequestReference:
  - RequestEntityReference:
      - Id: subject-entity-1
      - Id: action-entity-1
      - Id: resource-entity-1
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `RequestEntityReference` | Yes | *RequestEntityReferenceType* | 1..* |

Each referenced `Id` MUST identify a `RequestEntityType` object in the
enclosing `Request`, and the `Id` values in a single
`RequestReferenceType` object MUST be unique.

#### 5.8.6 RequestEntityReferenceType

```yaml
RequestEntityReference:
  - Id: subject-entity-1
  - Id: action-entity-1
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | *LocalIdentifierType* | 1 |

The `Id` value references the `Id` property of a `RequestEntityType`
object in the enclosing `Request`.

#### 5.8.7 ResponseType

```yaml
Response:
  Result:
    - Decision: Permit
      Status:
        StatusCode:
          Value: "urn:oasis:names:tc:acal:1.0:status:ok"
      Notice:
        - Id: "urn:example:yacal:notice:log-access"
          IsObligation: true
          AttributeAssignment:
            - AttributeId: "urn:example:yacal:notice:timestamp"
              Value:
                - "2026-03-23T14:30:00Z"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `ShortIdSetReference` | No | URI | * |
| `Result` | Yes | *ResultType* | 1..* |

YACAL permits multiple `Result` values in a `Response`, which is
especially relevant when the optional multi-request feature is used.

#### 5.8.8 ResultType

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Decision` | Yes | *DecisionType* | 1 |
| `Status` | No | *StatusType* | 0..1 |
| `Notice` | No | *NoticeType* | * |
| `ResultEntity` | No | *ResultEntityType* | * |
| `ApplicablePolicyReference` | No | *ExactMatchIdReferenceType* | * |

If the originating `Request.ReturnPolicyIdList` value is `true`, a
processor that supports this feature SHOULD populate
`ApplicablePolicyReference` with the identifiers of policies found to be
applicable to the request.

#### 5.8.9 ResultEntityType

```yaml
ResultEntity:
  - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
    Id: subject-entity-1
    Attribute:
      - AttributeId: "urn:example:yacal:subject:role"
        Value:
          - clinician
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Category` | Yes | *IdentifierType* | 1 |
| `Id` | No | *LocalIdentifierType* | 0..1 |
| `Attribute` | Yes | *AttributeType* | 1..* |

`ResultEntityType` reflects request attributes whose
`RequestAttribute.IncludeInResult` property was `true`.

Unlike `RequestEntityType`, `ResultEntityType` has no `Content`
property, and its contained `Attribute` objects have no
`IncludeInResult` property.

#### 5.8.10 ApplicablePolicyReference

`ApplicablePolicyReference` values use the direct mapping of
`ExactMatchIdReferenceType`:

```yaml
ApplicablePolicyReference:
  - Id: "urn:example:yacal:policy:content-access"
    Version: "1.0"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | URI | 1 |
| `Version` | Yes | *VersionType* | 1 |

Each item identifies a specific policy version that was applicable to
the request.  The `Id` value is a policy identifier URI and `Version`
is a required `VersionType` value for that exact match.

#### 5.8.11 RequestDefaultsType

`RequestDefaultsType` is an optional abstract extension point.  ACAL
core defines no concrete `RequestDefaultsType` subtype, so YACAL core
defines no fixed child properties for it.

In YACAL, the `RequestDefaults` property of a `RequestType` value is a
sequence of concrete profile-defined default objects.  Each item uses
the direct mapping of the relevant concrete subtype, following the
generic extension rules in
[Section 5.4.8](#548-extensible-abstract-types).

A profile that defines a concrete `RequestDefaultsType` subtype MUST
define:

1. the subtype's YACAL property set
2. whether any profile-specific wrapper key is used
3. any profile-specific constraints and defaults

------------------------------------------------------------------------

### 5.9 Notice Representation

#### 5.9.1 NoticeExpressionType

```yaml
NoticeExpression:
  - Id: "urn:example:yacal:notice:audit-log"
    IsObligation: true
    AppliesTo: Permit
    AttributeAssignmentExpression:
      - AttributeId: "urn:example:yacal:notice:action"
        Expression:
          AttributeDesignator:
            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
            AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
            MustBePresent: true
      - AttributeId: "urn:example:yacal:notice:subject"
        Expression:
          AttributeDesignator:
            Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
            AttributeId: "urn:example:yacal:subject:user-id"
            MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `Id` | Yes | — | *IdentifierType* | 1 |
| `IsObligation` | No | omitted | Boolean | 0..1 |
| `AppliesTo` | No | Permit or Deny | *EffectType* | 0..1 |
| `Condition` | No | satisfied | *BooleanExpressionType* | 0..1 |
| `AttributeAssignmentExpression` | No | — | *AttributeAssignmentExpressionType* | * |

If `AppliesTo` is omitted, the notice expression is eligible for either
`Permit` or `Deny`.

`AttributeAssignmentExpression` items SHOULD be unique by the pair
`(AttributeId, Category)`.

#### 5.9.2 AttributeAssignmentExpressionType

```yaml
AttributeAssignmentExpression:
  - AttributeId: "urn:example:yacal:notice:action"
    Category: "urn:example:yacal:notice-category:audit"
    Expression:
      AttributeDesignator:
        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
        MustBePresent: true
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `AttributeId` | Yes | *IdentifierType* | 1 |
| `Category` | No | *IdentifierType* | 0..1 |
| `Issuer` | No | Name | 0..1 |
| `Expression` | Yes | *ExpressionType* | 1 |

The `Expression` is evaluated to a constant value or bag of values to
produce the corresponding `AttributeAssignmentType` value or values in
the returned notice.

If the expression is a literal `ValueType` without a separately fixed
type, string is the default `DataType`.

#### 5.9.3 NoticeType

```yaml
Notice:
  - Id: "urn:example:yacal:notice:audit-log"
    IsObligation: true
    AttributeAssignment:
      - AttributeId: "urn:example:yacal:notice:action"
        Value:
          - read
      - AttributeId: "urn:example:yacal:notice:subject"
        Value:
          - "user-42"
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `Id` | Yes | — | *IdentifierType* | 1 |
| `IsObligation` | No | `false` | Boolean | 0..1 |
| `AttributeAssignment` | No | — | *AttributeAssignmentType* | * |

`AttributeAssignment` items SHOULD be unique by the pair
`(AttributeId, Category)`.

#### 5.9.4 AttributeAssignmentType

```yaml
AttributeAssignment:
  - AttributeId: "urn:example:yacal:notice:timestamp"
    Category: "urn:example:yacal:notice-category:audit"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:dateTime"
    Value:
      - "2026-03-23T14:30:00Z"
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `AttributeId` | Yes | — | *IdentifierType* | 1 |
| `Category` | No | — | *IdentifierType* | 0..1 |
| `Issuer` | No | — | Name | 0..1 |
| `DataType` | No | string | *IdentifierType* | 0..1 |
| `Value` | Yes | — | *ValueType* | 1..* |

`AttributeAssignmentType` extends `AttributeType` with the optional
`Category` property.  If the enclosing assignment defines `DataType`,
nested `Value` items SHOULD omit their own `DataType`; if present, they
MUST agree with the enclosing `DataType`.

------------------------------------------------------------------------

### 5.10 Status Representation

#### 5.10.1 StatusType

```yaml
Status:
  StatusCode:
    Value: "urn:oasis:names:tc:acal:1.0:status:ok"
  StatusMessage: Request processed successfully.
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `StatusCode` | Yes | *StatusCodeType* | 1 |
| `StatusMessage` | No | String | 0..1 |
| `StatusDetail` | No | *StatusDetailType* | 0..1 |

`StatusMessage` is a free-form human-readable string.

`StatusDetail`, if present, follows the rules in
[Section 5.10.3](#5103-statusdetailtype).

#### 5.10.2 StatusCodeType

```yaml
Status:
  StatusCode:
    Value: "urn:oasis:names:tc:acal:1.0:status:processing-error"
    StatusCode:
      Value: "urn:example:yacal:status:timeout"
  StatusMessage: PIP request timed out after 30 seconds.
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Value` | Yes | *IdentifierType* | 1 |
| `StatusCode` | No | *StatusCodeType* | 0..1 |

The optional nested `StatusCode` refines the parent status code and is
represented recursively using the same mapping rules.

#### 5.10.3 StatusDetailType

`StatusDetailType` is optional and carries additional status
information.  In YACAL, it is represented as a YAML mapping whose keys
identify the supported detail objects.

The core YACAL detail key defined by this specification is
`MissingAttributeDetail`.

Example:

```yaml
StatusDetail:
  MissingAttributeDetail:
    - AttributeId: "urn:example:yacal:subject:clearance-level"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
      Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      Value:
        - confidential
```

If `StatusCode.Value` is:

- `urn:oasis:names:tc:acal:1.0:status:ok`, `StatusDetail` MUST NOT be
  present
- `urn:oasis:names:tc:acal:1.0:status:syntax-error`, `StatusDetail`
  MUST NOT be present
- `urn:oasis:names:tc:acal:1.0:status:processing-error`,
  `StatusDetail` MUST NOT be present
- `urn:oasis:names:tc:acal:1.0:status:missing-attribute`,
  `StatusDetail` MAY contain one or more `MissingAttributeDetail`
  values

Profiles or implementation agreements MAY define additional
representation-specific `StatusDetail` entries, but processors MUST
reject unsupported entries they do not claim to implement.

#### 5.10.4 MissingAttributeDetailType

```yaml
Status:
  StatusCode:
    Value: "urn:oasis:names:tc:acal:1.0:status:missing-attribute"
  StatusDetail:
    MissingAttributeDetail:
      - AttributeId: "urn:example:yacal:subject:clearance-level"
        DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
        Value:
          - confidential
          - secret
          - top-secret
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Category` | Yes | *IdentifierType* | 1 |
| `AttributeId` | Yes | *IdentifierType* | 1 |
| `Issuer` | No | Name | 0..1 |
| `DataType` | Yes | *IdentifierType* | 1 |
| `Value` | No | *ValueType* | * |

If `Value` items are present, each nested value SHOULD omit its own
`DataType` because the enclosing `MissingAttributeDetailType` already
defines it.

------------------------------------------------------------------------

### 5.11 Short Identifier Representation

YACAL uses the ACAL core identifier sets defined by
[[ACAL-Core](#acal-core)] directly.  It defines no separate
YACAL-specific core identifier inventory for WD01.  Any
`ShortIdSetReference` in a YACAL document therefore refers to the same
identifier sets and short identifier semantics defined by ACAL core or
by the relevant ACAL profile.

#### 5.11.1 ShortIdSetType

```yaml
ShortIdSet:
  - Id: "urn:example:yacal:ids:healthcare"
    ShortIdSetReference:
      - "urn:oasis:names:tc:acal:1.0:core:identifiers"
    ShortId:
      - Name: subject-role
        Value: "urn:example:yacal:healthcare:subject:role"
      - Name: resource-type
        Value: "urn:example:yacal:healthcare:resource:type"
      - Name: record-type
        Value: "urn:example:yacal:healthcare:resource:record-type"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | URI | 1 |
| `ShortIdSetReference` | No | URI | * |
| `ShortId` | No | *ShortIdType* | * |

The referenced short-id sets are applied recursively.  A conformant
processor MUST reject direct or indirect cycles in
`ShortIdSetReference`.

#### 5.11.2 ShortIdType

```yaml
ShortId:
  - Name: subject-role
    Value: "urn:example:yacal:healthcare:subject:role"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Name` | Yes | *LocalIdentifierType* | 1 |
| `Value` | Yes | URI | 1 |

Within a single `ShortIdSetType`, `Name` values MUST be unique.

#### 5.11.3 ShortIdSetReference

`ShortIdSetReference` is represented as a YAML sequence of URI values:

```yaml
ShortIdSetReference:
  - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  - "urn:example:yacal:ids:healthcare"
```

Each URI references a `ShortIdSetType` object.  The referenced sets and
their transitive references define the short identifiers available in
the containing object.

#### 5.11.4 Usage in Policies

Short identifiers, once declared, may be used anywhere an
*IdentifierType* is expected:

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:healthcare"
  Version: "1.0"
  CombiningAlgId: deny-unless-permit
  ShortIdSetReference:
    - "urn:example:yacal:ids:healthcare"
  CombinerInput:
    - Rule:
        Id: PermitClinicianRead
        Effect: Permit
        Condition:
          Apply:
            FunctionId: string-is-in
            Expression:
              - Value: clinician
              - AttributeDesignator:
                  Category: access-subject
                  AttributeId: subject-role
                  MustBePresent: true
```

------------------------------------------------------------------------

### 5.12 Constraint Handling

#### 5.12.1 Constraint Categories

YACAL conformance depends on more than well-formed YAML syntax.  A
conformant YACAL document MUST satisfy:

1. **YAML-level constraints**, such as valid YAML 1.2 syntax and use of
   the Core Schema
2. **YACAL structural constraints**, such as root-key rules,
   wrapper-key rules, multiplicity rules, omission rules, and typing
   rules defined in this specification
3. **ACAL semantic constraints**, including the property-level and
   object-level constraints defined by the ACAL model

Some constraints can be checked directly from the YAML structure.
Others require interpretation of ACAL types, inheritance, identifier
scope, or profile-specific semantics.  A document MAY therefore be valid
YAML yet still be non-conformant YACAL.

#### 5.12.2 Property-Level Constraints

Unless a more specific rule applies, the following property-level
constraints apply:

1. Lower and upper multiplicity constraints from ACAL MUST be enforced.
2. If an ACAL property is declared ordered, the order of items in the
   YAML sequence is semantically significant and MUST be preserved.
3. If an ACAL property is declared unordered, the YAML sequence MAY still
   preserve presentation order, but processors MUST NOT assign semantic
   meaning to that order unless ACAL does so separately.
4. If an ACAL property is constrained to have unique primitive values,
   duplicate values in the corresponding YAML sequence are invalid.
5. If an ACAL property is constrained to have uniqueness based on one or
   more nested properties, processors MUST enforce that uniqueness using
   the ACAL-defined key semantics, even though YAML itself does not
   provide such a constraint mechanism.
6. If an ACAL property requires uniqueness by concrete subtype, then no
   two values of that property may denote the same effective subtype.

Examples of ACAL-defined uniqueness constraints that YACAL processors
MUST enforce where those properties are supported include:

- `VariableDefinition` uniqueness by `VariableId`
- `Parameter` uniqueness by `Name`
- `ShortId` uniqueness by `Name`
- `RequestAttribute` uniqueness by `AttributeId` within a
  `RequestEntityType`
- `PolicyDefaults` and `RequestDefaults` uniqueness by concrete subtype

#### 5.12.3 Object-Level Constraints and Cross-Property Invariants

Some ACAL constraints involve the relationship between multiple
properties or the interpreted meaning of the object as a whole.  Such
constraints remain normative for YACAL even when they are not directly
expressible in YAML syntax.

Examples include:

- an object requiring one of multiple properties or property groups to
  be present
- cross-property agreement requirements, such as parent and child
  `DataType` consistency
- identifier-scope constraints, such as uniqueness of variable
  references within their effective scope
- type-correctness constraints for expressions and function arguments

YACAL processors MUST evaluate these constraints according to ACAL and
this specification for all supported object types.

#### 5.12.4 Enforcement Expectations

Conformant YACAL processors:

1. MUST reject violations of YACAL structural constraints.
2. MUST reject violations of ACAL constraints for supported object
   types and features.
3. MAY use additional validation artifacts or intermediate
   representations as implementation techniques.
4. MUST NOT treat the absence of such artifacts as making a document
   valid if the document violates YACAL or ACAL constraints.
5. SHOULD report whether a failure is primarily:
   1. a YAML parsing error
   2. a YACAL structural error
   3. an ACAL semantic or constraint error

------------------------------------------------------------------------

## 6. Safety, Security and Privacy Considerations (non-normative)

### 6.1 YAML Parser and Processor Safety

YACAL processors should use YAML parsers configured for YAML 1.2 Core
Schema behavior and should reject features prohibited by this
specification, including tags, anchors, aliases, merge keys, and
multi-document streams.  These restrictions reduce ambiguity and avoid
processor behaviors that have no corresponding ACAL semantics.

Implementations should apply ordinary defensive parsing measures,
including limits on document size, nesting depth, alias expansion
behavior, and resource consumption.  Error diagnostics should be
reported against the original YACAL source where possible.

### 6.2 Interoperability and Content Handling

YAML scalar resolution can create interoperability hazards when values
resemble booleans, numbers, or nulls.  The quoting rules in
[Section 5.1.3](#513-string-quoting) help prevent such ambiguity and
should be followed carefully by producers and processors.

Where ACAL profiles permit embedded or referenced content, processors
should treat such content according to its media type and associated
security expectations.  Conversion between YACAL and other concrete
representations, if performed by an implementation, does not preserve
all YAML presentation details and should not be treated as a security
boundary.

------------------------------------------------------------------------

## 7. Conformance

### 7.1 Introduction

The YACAL specification addresses conformance in the following areas:

1. conformance of YACAL documents
2. conformance of YACAL processors
3. support for mandatory and optional YACAL syntax objects derived from
   ACAL core

Some ACAL objects and features are optional to implement, either because
they are optional in ACAL core or because they are only required when
supporting specific ACAL profiles or deployment scenarios.  If an
implementation claims support for such an optional feature, it MUST
implement the corresponding YACAL syntax, typing, and constraint rules
consistently.

This specification is accompanied by normative machine-readable
artifacts for core YACAL structure, core constraints, core short
identifiers, and selected ACAL profiles.  These artifacts support
consistent implementation and validation of YACAL, but they do not
change the peer relationship between YACAL and the XML and JSON ACAL
representations.

### 7.2 Conformance Categories

For the purposes of this specification:

- **M** means mandatory-to-implement for a processor claiming core YACAL
  conformance
- **O** means optional-to-implement

An implementation MUST follow [Section 5](#5-syntax-normative) where it
applies to implemented items in the following tables.

### 7.3 Conformance Tables

#### 7.3.1 Syntax Objects

The implementation MUST support those YACAL syntax objects marked `M`.

| Object name | M/O | Notes |
|:---|:---:|:---|
| `Apply` | M | Core expression form |
| `ApplicablePolicyReference` | O | Optional result detail support |
| `Attribute` | M | Reusable attribute object used in request, result, entity, and notice contexts |
| `AttributeAssignment` | M | Mandatory when notices are supported |
| `AttributeAssignmentExpression` | M | Core notice-expression syntax |
| `AttributeDesignator` | M | Core expression form |
| `AttributeSelector` | O | Optional/profile-based |
| `Bundle` | O | Optional bundle support |
| `Category` | M | Reusable identifier-valued property |
| `Condition` | M | Core rule syntax |
| `Content` | O | Optional/profile-based |
| `Description` | M | Reusable free-form string property |
| `EntityAttributeDesignator` | O | Optional in ACAL core support model |
| `EntityAttributeSelector` | O | Optional/profile-based |
| `Expression` | M | Core expression container |
| `ForAll` | O | Optional quantified expression |
| `ForAny` | O | Optional quantified expression |
| `Function` | M | Core higher-order expression form |
| `Map` | O | Optional quantified expression |
| `MissingAttributeDetail` | M | Core status-detail object |
| `MultiRequests` | O | Optional request feature |
| `Notice` | M | Core response object |
| `NoticeExpression` | M | Core policy/rule object |
| `Policy` | M | Core root/support object |
| `PolicyDefaults` | O | Optional/profile-based |
| `PolicyPatternMatchReference` | O | Optional pattern-match policy reference |
| `PolicyReference` | M | Core reference object |
| `PolicyIssuer` | O | Optional support |
| `Request` | M | Core root/support object |
| `RequestAttribute` | M | Core request object |
| `RequestDefaults` | O | Optional/profile-based |
| `RequestEntity` | M | Core request object |
| `RequestEntityReference` | O | Optional multi-request support |
| `RequestReference` | O | Optional multi-request support |
| `Response` | M | Core root/support object |
| `Result` | M | Core response object |
| `ResultEntity` | M | Core response object |
| `Rule` | M | Core combiner object |
| `Select` | O | Optional quantified expression |
| `SharedVariableDefinition` | O | Optional bundle feature |
| `SharedVariableReference` | O | Optional bundle feature |
| `ShortId` | M | Core short-identifier object |
| `ShortIdSet` | M | Core short-identifier object |
| `ShortIdSetReference` | M | Core short-identifier reference |
| `Status` | M | Core response object |
| `StatusCode` | M | Core status object |
| `StatusDetail` | O | Optional detailed status support |
| `StatusMessage` | O | Optional detailed status support |
| `Target` | M | Core policy object |
| `Value` | M | Core literal expression form |
| `VariableDefinition` | M | Core variable object |
| `VariableReference` | M | Core expression form |

Reusable entries such as `Attribute`, `Category`, and `Description` use
the shared mapping rules in [Section 5.4](#54-complex-type-mapping),
while the remaining entries are given dedicated object-level mappings in
later subsections.

#### 7.3.2 Machine-Readable Artifact Support

The following machine-readable artifacts accompany this specification:

| Artifact | Status | Notes |
|:---|:---:|:---|
| `acal-core-yaml-v1.0-structure.schema.yaml` | M | Core structural validation artifact |
| `acal-core-yaml-v1.0-constraints.yaml` | M | Core constraint catalog |
| `acal-core-yaml-v1.0-identifiers.yaml` | M | Core short-identifier set |
| `acal-xpath-yaml-v1.0-structure.schema.yaml` | O | Required only for XPath Profile support |
| `acal-xpath-yaml-v1.0-identifiers.yaml` | O | Required only for XPath Profile support |
| `acal-jsonpath-yaml-v1.0-structure.schema.yaml` | O | Required only for JSONPath Profile support |

The composition schemas listed in [Annex C](#annex-c-yacal-identifiers-and-machine-readable-artifacts)
are informative examples showing how core and profile artifacts may be
combined in a particular deployment.

### 7.4 Conformant YACAL Document

A conformant YACAL document:

1.  MUST be a valid YAML 1.2 document [[YAML1.2](#yaml12)].
2.  MUST use the YAML 1.2 Core Schema for scalar type resolution.
3.  MUST conform to all structural requirements defined in this
    specification.
4.  MUST correspond to a semantically valid ACAL instance when
    interpreted according to this specification and [[ACAL-Core](#acal-core)].
5.  MUST satisfy the applicable constraint rules in
    [Section 5.12](#512-constraint-handling).
6.  MUST NOT use YAML tags (e.g., `!!str`, `!custom`).
7.  MUST NOT use YAML anchors (`&name`) or aliases (`*name`).
8.  MUST NOT use YAML merge keys or multi-document streams.
9.  MUST NOT use YAML null values (e.g. `null`, `Null`, `NULL`, `~` or undefined).
10. MUST NOT use the YAML octal notation for integers (any value matching the regular expression `0o [0-7]+`).
11. SHOULD use YAML block style for mappings and sequences.  Flow style
    MAY be used where it improves readability (e.g., for short inline
    values).
12. If it uses only core YACAL features, it MUST be structurally
    compatible with `acal-core-yaml-v1.0-structure.schema.yaml`.
13. If it uses XPath or JSONPath profile features, it MUST be
    structurally compatible with a composition schema that enables the
    corresponding profile artifacts.

### 7.5 Conformant YACAL Processor

A conformant YACAL processor:

1.  MUST parse YAML 1.2 documents using the Core Schema.
2.  MUST reject documents that use prohibited YAML features.
3.  MUST interpret conformant YACAL documents according to this
    specification and ACAL evaluation semantics as defined in
    [[ACAL-Core](#acal-core)].
4.  MUST enforce the applicable structural and semantic constraints
    defined in this specification and in ACAL for all supported
    objects and features.
5.  If it claims support for an optional syntax object marked `O` in
    [Section 7.3.1](#731-syntax-objects), it MUST implement the
    corresponding syntax, typing, inheritance, and constraint rules
    consistently.
6.  A processor claiming core YACAL conformance MUST support the core
    machine-readable artifacts listed as mandatory in
    [Section 7.3.2](#732-machine-readable-artifact-support), or provide
    equivalent enforcement of the same structural, identifier, and
    constraint rules.
7.  A processor claiming support for the XPath Profile or JSONPath
    Profile MUST support the corresponding profile artifacts, or provide
    equivalent enforcement of the same profile-specific rules.

### 7.6 Validation Support and Error Reporting

Validation of a YACAL document may be performed in multiple layers:

1.  **YAML parsing**: the document is parsed as YAML 1.2 with Core
    Schema.
2.  **YACAL structural validation**: the parsed content is checked
    against the structural and typing rules defined in this
    specification, typically with `acal-core-yaml-v1.0-structure.schema.yaml`
    or an applicable composition schema.
3.  **Constraint validation**: property-level and object-level
    constraints are checked according to [Section 5.12](#512-constraint-handling),
    ACAL, and, where used, `acal-core-yaml-v1.0-constraints.yaml`.
4.  **ACAL semantic validation**: the resulting representation is
    checked against applicable ACAL model constraints and semantics.

Conformant processors SHOULD report validation errors with reference to
the original YACAL source location (line and column), not solely to any
derived intermediate representation.

------------------------------------------------------------------------

## Annex A. License, Document Status and Notices

(This annex forms an integral part of this Specification.)

### A.1 Document Status

This working draft was prepared for the OASIS eXtensible Access Control
Markup Language (XACML) TC on the date shown above.

This document is a working draft rather than an approved OASIS final
deliverable.  Stable publication metadata, publication URLs, and any
required formal OASIS boilerplate should be updated when the document
advances to committee publication.

This working draft declares the machine-readable artifacts listed in the
front matter as part of the work product.  Normative artifacts are also
summarized in [Annex C](#annex-c-yacal-identifiers-and-machine-readable-artifacts).

NOTE: any machine-readable content (Computer Language Definitions)
declared Normative for this Work Product is provided in separate plain
text files.  In the event of a discrepancy between any such plain text
file and display content in the Work Product's prose narrative
document(s), the content in the separate plain text file prevails.

### A.2 License and Notices

Copyright © OASIS Open 2026. All Rights Reserved.

This working draft is prepared for committee review.  Formal OASIS
license and notice text should be confirmed and updated at publication
time.

------------------------------------------------------------------------

## Annex B. References

(This annex forms an integral part of this Specification.)

This section contains the normative references used in this document.

Normative references are those whose content constitutes requirements of
this specification.

### B.1 Normative References

<a id="acal-core"></a>**[ACAL-Core]**
: *Attribute-Centric Authorization Language (ACAL) Version 1.0*.
  OASIS Committee Specification.
  https://docs.oasis-open.org/xacml/acal/acal/core/v1.0/acal-core-v1.0.html

<a id="yaml12"></a>**[YAML1.2]**
: *YAML Ain't Markup Language (YAML) Version 1.2*.
  https://yaml.org/spec/1.2.2/

<a id="rfc2119"></a>**[RFC2119]**
: Bradner, S., "Key words for use in RFCs to Indicate Requirement
  Levels", BCP 14, RFC 2119, March 1997.
  https://www.rfc-editor.org/rfc/rfc2119
  
<a id="rfc3986"></a>**[RFC3986]**
: Berners-Lee, T., Fielding, R., and L. Masinter, "Uniform Resource
  Identifier (URI): Generic Syntax", STD 66, RFC 3986, January 2005.
  https://www.rfc-editor.org/rfc/rfc3986

<a id="rfc4648"></a>**[RFC4648]**               
: RFC 4648, *The Base16, Base32, and Base64 Data Encodings.* October 2006. IETF RFC 4648. http://tools.ietf.org/html/rfc4648

<a id="rfc8174"></a>**[RFC8174]**
: Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key
  Words", BCP 14, RFC 8174, May 2017.
  https://www.rfc-editor.org/rfc/rfc8174

------------------------------------------------------------------------

## Annex C. YACAL Identifiers and Machine-Readable Artifacts

(This annex forms an integral part of this Specification.)

### C.1 Core Short-Identifier Set

This work product provides the standard YACAL serialization of the ACAL
core short-identifier set in the file
`acal-core-yaml-v1.0-identifiers.yaml`.

The `ShortIdSet.Id` value of this artifact is:

`urn:oasis:names:tc:acal:1.0:core:identifiers`

YACAL uses the ACAL core identifier inventory directly.  The YACAL
artifact is therefore the YAML serialization of the same underlying ACAL
identifier set used by peer concrete representations.

### C.2 Core YACAL Artifacts

The following normative core YACAL artifacts accompany this
specification:

1. `acal-core-yaml-v1.0-structure.schema.yaml`
2. `acal-core-yaml-v1.0-constraints.yaml`
3. `acal-core-yaml-v1.0-identifiers.yaml`

The structural schema defines the core YACAL root forms, object shapes,
property names, primitive patterns, wrapper-key structures, and
extension hooks.

The constraint catalog defines the higher-order YACAL and ACAL
constraints that are not fully captured by the structural schema alone.

### C.3 Profile YACAL Artifacts

The following normative profile artifacts accompany this specification:

1. `acal-xpath-yaml-v1.0-structure.schema.yaml`
2. `acal-xpath-yaml-v1.0-identifiers.yaml`
3. `acal-jsonpath-yaml-v1.0-structure.schema.yaml`

The XPath Profile artifacts enable XPath-specific defaults, selector
extensions, structured values, and profile identifiers.

The JSONPath Profile artifact enables JSONPath-specific selector
extensions.  The JSONPath Profile defines no profile-specific
identifiers and therefore has no companion identifier artifact.

### C.4 Informative Composition Schemas

The following informative composition schemas are provided as examples
for implementations combining the core and profile artifacts:

1. `yacal-root-structure-example-core-only.schema.yaml`
2. `yacal-root-structure-example-using-jsonpath-profile-only.schema.yaml`
3. `yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml`
4. `yacal-root-structure-example-custom-plus-profile.schema.yaml`

These example schemas do not form part of the normative YACAL syntax.
They are provided as implementer guidance for composing extension hooks
and profile support in deployment-specific root schemas.

------------------------------------------------------------------------

## Annex D. Complete Example: Website Content Access Policy

(This annex does not form an integral part of this Specification and is
informational.)

This example shows a policy controlling access to website content based
on content tier and account type.

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:website-content-access"
  Version: "1.0"
  Description: >-
    Permit view access to website pages according to the page content
    tier and, where required, the subject account type.
  CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
  CombinerInput:
    - Rule:
        Id: PermitPublicContentView
        Description: Permit any request to view public content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Expression:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: view
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: public
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:content-tier"
                        MustBePresent: true
    - Rule:
        Id: PermitRegisteredContentView
        Description: Permit registered and premium users to view registered content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Expression:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: view
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: registered
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:content-tier"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:or"
                  Expression:
                    - Apply:
                        FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                        Expression:
                          - Value: registered
                          - AttributeDesignator:
                              Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                              AttributeId: "urn:example:yacal:subject:account-type"
                              MustBePresent: true
                    - Apply:
                        FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                        Expression:
                          - Value: premium
                          - AttributeDesignator:
                              Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                              AttributeId: "urn:example:yacal:subject:account-type"
                              MustBePresent: true
    - Rule:
        Id: PermitPremiumContentView
        Description: Permit only premium users to view premium content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Expression:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: view
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: premium
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:content-tier"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: premium
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                        AttributeId: "urn:example:yacal:subject:account-type"
                        MustBePresent: true
```

------------------------------------------------------------------------

## Annex E. Complete Example: Healthcare Chart Access Policy

(This annex does not form an integral part of this Specification and is
informational.)

This example demonstrates a deny-unless-permit policy with role-based
and resource-type conditions.

```yaml
Policy:
  PolicyId: "urn:example:yacal:healthcare:access-patient-record"
  Version: "1.0"
  CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
  CombinerInput:
    - Rule:
        Id: PermitClinicianRead
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Expression:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: clinician
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                        AttributeId: "urn:example:yacal:healthcare:subject:role"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Expression:
                    - Value: medical-record
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:healthcare:resource:record-type"
                        MustBePresent: true
```

------------------------------------------------------------------------

## Appendix 1. Acknowledgments

(This appendix does not form an integral part of this Specification and
is informational.)

### Leadership

The following individuals have had significant leadership roles in the
development of related ACAL representation work and are gratefully
acknowledged:

- Chairs
  - Bill Parducci, Individual
- Secretaries
  - Bill Parducci, Individual
- Editors
  - Steven Legg, ViewDS Identity Solutions
  - Cyril Dangerville, THALES

### Special Thanks

Substantial drafting and review contributions from Steven Legg, Cyril
Dangerville, and Bill Parducci are gratefully acknowledged.

### Participants

The following individuals are acknowledged as members of the committee
active during the creation of this working draft:

- Hal Lockhart, Individual
- Bill Parducci, Individual
- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES

------------------------------------------------------------------------

## Appendix 2. Changes From Previous Version

(This appendix does not form an integral part of this Specification and
is informational.)

This is the first public working draft of the YACAL representation
document.

### Revision History

- 2026-03-23, Working Draft 01
