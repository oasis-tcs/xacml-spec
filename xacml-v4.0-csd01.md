![OASIS](http://docs.oasis-open.org/templates/OASISLogo-v3.0.png)

---

# eXtensible Access Control Markup Language (XACML) Version 4.0 (XML Representation of ACAL Version 1.0)

## Committee Specification Draft 01

## 17 February 2026

### This version:

<!-- TODO: fix those URLs -->
https://docs.oasis-open.org/xacml/v4.0/csd01/xacml-v4.0-csd01.md (Authoritative) \
https://docs.oasis-open.org/xacml/v4.0/csd01/xacml-v4.0-csd01.html \
https://docs.oasis-open.org/xacml/v4.0/csd01/xacml-v4.0-csd01.pdf

### Previous version:

N/A

### Latest version:


https://docs.oasis-open.org/xacml/v4.0/xacml-v4.0.md (Authoritative) \
https://docs.oasis-open.org/xacml/v4.0/xacml-v4.0.html \
https://docs.oasis-open.org/xacml/v4.0/xacml-v4.0.pdf

### Technical Committee:

[OASIS eXtensible Access Control Markup Language (XACML) TC](https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=67afe552-0921-49b7-9a85-018dc7d3ef1d#technical)

### Chairs:

- Bill Parducci (bill@parducci.net), Individual

### Secretaries

- Bill Parducci (bill@parducci.net), Individual  

### Editors:

- Steven Legg (steven.legg@viewds.com), [ViewDS Identity Solutions](https://www.viewds.com/)
- Cyril Dangerville (cyril.dangerville@thalesgroup.com), [THALES](https://www.thalesgroup.com/)
- Bill Parducci (bill@parducci.net), Individual

### Additional artifacts:

This document is one component of a Work Product that also includes:

* Core XML schema: <!-- TODO: check this URL -->  https://docs.oasis-open.org/xacml/4.0/csd01/schema/xacml-core-v4.0-schema.xsd
* Core Schematron rules: [xacml-core-v4.0-schematron.sch](xacml-core-v4.0-schematron.sch)
* Short identifier set: [xacml-core-v4.0-identifiers.xml](xacml-core-v4.0-identifiers.xml)
* XPath Profile XML schema: [xacml-xpath-v4.0-schema.xsd](xacml-xpath-v4.0-schema.xsd)
* JSONPath Profile XML schema: [xacml-jsonpath-v4.0-schema.xsd](xacml-jsonpath-v4.0-schema.xsd)

<!-- Note: Any normative computer language definitions that are part of the Work Product, such as XML instances, schemas and Java(TM) code, including fragments of such, must be (a) well formed and valid, (b) provided in separate plain text files, (c) referenced from the Work Product; and (d) where any definition in these separate files disagrees with the definition found in the specification, the definition in the separate file prevails. Remove this note before submitting for publication.)
-->

### Abstract:

This specification defines Version 4.0 of the eXtensible Access Control Markup Language which now represents the XML representation Profile of the ACAL Version 1.0, also produced by the same OASIS XACML Technical Committee.

### Citation format:

When referencing this specification the following citation format should be used:

**[XACML-v4.0]**

_eXtensible Access Control Markup Language (XACML) Version 4.0_.
Edited by Steven Legg and Cyril Dangerville. 17 February 2026. OASIS Committee Specification Draft 01.
https://docs.oasis-open.org/xacml/v4.0/csd01/xacml-v4.0-csd01.html.
Latest stage: https://docs.oasis-open.org/xacml/v4.0/xacml-v4.0.html.

### Related work:

This specification replaces or supersedes:

* _eXtensible Access Control Markup Language (XACML) Version 3.0 Plus Errata 01_. Edited by Erik Rissanen. OASIS Standard incorporating Approved Errata. https://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-en.html.

This specification is related to:

* _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg and Cyril Dangerville. 17 February 2026. OASIS Committee Specification Draft 01.


## License, Document Status, and Notices

Copyright © OASIS Open 2026. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

## How to generate HTML and PDF versions

### Online generation

HTML/PDF versions are generated automatically online via Github Actions after each update pushed to the main branch of [OASIS XACML TC code repository](https://github.com/oasis-tcs/xacml-spec/). Go to  Github Actions on the repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

### Offline generation

#### Prerequisites

The following tools are required:

- [Pandoc](https://pandoc.org/);
- [Pandoc-include filter](https://github.com/DCsunset/pandoc-include).

Either install them on your system or, if you have Docker installed already, simply use the following shell alias:
```
$ alias pandoc='docker run --rm --volume "$(pwd):/data" pandoc/extra'
```

OASIS staff are currently using pandoc 3.0 from https://github.com/jgm/pandoc/releases/tag/3.0.

Git clone or get a local copy of [OASIS XACML TC code repository](https://github.com/oasis-tcs/xacml-spec/), open a terminal and **change your working directory to the root directory of your local copy of the repository**.

#### CSS stylesheet

The generation command uses a CSS stylesheet file (`-c` argument) provided by OASIS. It may be changed to one of these (or the local version in the `styles` folder) to get a different style of output:

- https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3.css
- https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3a.css (this one produces HTML that resembles the github display more closely, especially for blocks of code) This template already includes a reference (in HTML code) to this .css file.
- https://docs.oasis-open.org/templates/css/markdown-styles-v1.8.1-cn_final.css

#### HTML generation

Run the following command line to generate HTML from this markdown file (named `xacml-v4.0-csd01.md`) to an output file `/tmp/xacml-v4.0-csd01.html` :

```console
$ pandoc -s --verbose --embed-resources -f gfm+definition_lists -c styles/markdown-styles-v1.7.3a.css -F pandoc-include -M lang=en -M title="eXtensible Access Control Markup Language (XACML) Version 4.0 (XML Representation of ACAL Version 1.0)" -t html -o /tmp/xacml-v4.0-csd01.html xacml-v4.0-csd01.md
```

Note this command generates a document which may require additional editing in order to be published in the expected OASIS style. This editing will be handled by OASIS staff during publication.

#### PDF generation

For PDF output, the command line is the following (different `-t` and `-H` arguments, and output goes to file `/tmp/xacml-v4.0-csd01.pdf`):

```console
$ pandoc -s --embed-resources -f gfm+definition_lists -c styles/markdown-styles-v1.7.3a.css -F pandoc-include -H pandoc/custom_latex_header_for_pandoc_pdf_output.tex --metadata title="eXtensible Access Control Markup Language (XACML) Version 4.0 (XML Representation of ACAL Version 1.0)" -t pdf -o /tmp/xacml-v4.0-csd01.pdf xacml-v4.0-csd01.md
```


-------

# Table of Contents

<!-- ToC template from OASIS Open Specification Template Instructions:

- [1 Scope](#1-scope)
- [2 Definitions and Acronyms](#2-definitions-and-acronyms)
  - [2.1 Definitions](#2.1-definitions)
    - [2.1.1 Terms Defined Elsewhere](#2.1.1-terms-defined-elsewhere)
    - [2.1.2 Terms Defined in this Document](#2.1.2-terms-defined-in-this-document)
  - [2.2 Abbreviations and Acronyms](#2.2-abbreviations-and-acronyms)
- [3 Document Conventions](#3-document-conventions)
  - [3.1 Key Words](#3.1-key-words)
  - [3.2 Typographical Conventions](#3.2-typographical-conventions)
- [4 Introduction](#4-introduction)
  - [4.1 Any Additional Introduction Subsections That are Needed](#4.1-any-additional-introduction-subsections-that-are-needed)
  - [4.2 Changes From the Previous Version](#4.2-changes-from-the-previous-version)
- [5 Level 1 Section Header](#5-level-1-section-header)
  - [5.1 Level 2 Section Header](#5.1-level-2-section-header)
    - [5.1.1 Level 3 Section Header](#5.1.1-level-3-section-header)
      - [5.1.1.1 Level 4 Section Header](#5.1.1.1-level-4-section-header)
        - [5.1.1.1.1 Level 5 Section Header](#5.1.1.1.1-level-5-section-header)
          - [5.1.1.1.1.1 Level 6 Section Header](#5.1.1.1.1.1-level-6-section-header)
- [6 Additional Sections as Needed](#6-additional-sections-as-needed)
- [7 Safety, Security, and Data Protection Considerations](#7-safety,-security,-and-data-protection-considerations)
- [8 Conformance](#8-conformance)
- [Annex A License, Document Status and Notices](#annex-a-license,-document-status-and-notices)
  - [A.1 Document Status](#a.1-document-status)
  - [A.2 License and Notices](#a.2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b.1-normative-references)
  - [B.2 Informative References](#b.2-informative-references)
- [Annex C Additional Annex as Needed](#annex-c-additional-annex-as-needed)
  - [C.1 Subsection Title](#c.1-subsection-title)
  - [C.1.1 Sub-subsection](#c.1.1-sub-subsection)
- [Appendix 1 Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Special Thanks](#special-thanks)
  - [Participants](#participants)
- [Appendix 2 Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)
- [Appendix 3 Additional Appendix as Needed](#appendix-3-additional-appendix-as-needed)
  - [Subsection Title](#subsection-title)
- [Sub-subsection](#sub-subsection)
-->

<!-- Generated ToC -->
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
  - [3.3 Schema organization and namespaces](#33-schema-organization-and-namespaces)
- [4 Introduction (non-normative)](#4-introduction-non-normative)
  - [4.1 Requirements](#41-requirements)
  - [4.2 Abstraction Layer](#42-abstraction-layer)
  - [4.3 Example Short Identifier Set](#43-example-short-identifier-set)
  - [4.4 Changes From the Previous Version](#44-changes-from-the-previous-version)
- [5 Syntax (normative, with the exception of the schema fragments)](#5-syntax-normative-with-the-exception-of-the-schema-fragments)
  - [5.1 Mapping ACAL primitive types](#51-mapping-acal-primitive-types)
    - [5.1.1 Primitive types mapped to standard XSD data-types](#511-primitive-types-mapped-to-standard-xsd-data-types)
    - [5.1.2 Restricted String types (UML stereotype `<<restrictedString>>`)](#512-restricted-string-types-uml-stereotype-restrictedstring)
    - [5.1.3 Enum types (UML stereotype `<<enumeration>>`)](#513-enum-types-uml-stereotype-enumeration)
  - [5.2 Mapping complex ACAL types (UML stereotype `<<dataType>>`)](#52-mapping-complex-acal-types-uml-stereotype-datatype)
    - [5.2.1 AnyType mapping rule](#521-anytype-mapping-rule)
    - [5.2.2 Single-use empty datatypes](#522-single-use-empty-datatypes)
    - [5.2.3 ValueType mapping rules](#523-valuetype-mapping-rules)
    - [5.2.4 Default mapping rules for complex ACAL types (other than ValueType)](#524-default-mapping-rules-for-complex-acal-types-other-than-valuetype)
    - [5.2.5 Property mapping rules](#525-property-mapping-rules)
    - [5.2.6 Mapping complex ACAL constraints (OCL)](#526-mapping-complex-acal-constraints-ocl)
      - [5.2.6.1 Option 1: XML Schema 1.1 assertions](#5261-option-1-xml-schema-11-assertions)
      - [5.2.6.2 Option 2: Schematron rules](#5262-option-2-schematron-rules)
  - [5.3 Content Types and Body representations (optional)](#53-content-types-and-body-representations-optional)
- [6 Safety, Security and Privacy Considerations (non-normative)](#6-safety-security-and-privacy-considerations-non-normative)
  - [6.1 Threat model](#61-threat-model)
  - [6.2 Safeguards](#62-safeguards)
    - [6.2.1 Policy confidentiality](#621-policy-confidentiality)
    - [6.2.2 Policy integrity](#622-policy-integrity)
- [7 Conformance](#7-conformance)
  - [7.1 Introduction](#71-introduction)
  - [7.2 Conformance tables](#72-conformance-tables)
    - [7.2.1 Schema elements](#721-schema-elements)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C. XACML identifiers (normative)](#annex-c-xacml-identifiers-normative)
  - [C.1 XACML namespaces](#c1-xacml-namespaces)
- [Annex D. XML Schema (normative)](#annex-d-xml-schema-normative)
- [Appendix 1. Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Special Thanks](#special-thanks)
  - [Participants](#participants)
- [Appendix 2 Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)
- [Appendix 3 OASIS Open Specification Template Instructions](#appendix-3-oasis-open-specification-template-instructions)



-------

# 1 Scope

<!-- OASIS Open Specification Template Instructions: 

What is the purpose and scope of this document?   
Best practices: 

- Expect this text to be reused in multiple other places to explain the specification in summary form.  
- This is not the TC or OP scope (which is an IPR and rules boundary);  rather, this section is the summary intended purpose of this specification.  
- Short is better; four paragraphs or less is recommended.  
- If use of this spec is deliberately created to rely on or complement another standard, consider briefly mentioning that here as context.  
- To the extent that discussion of the larger context of the spec, or its history, or the circumstances that led to its creation or revision, are necessary, they belong in the Introduction, not here. 

-->

This specification defines the XML representation format of the [ACAL] model and any XML-specific syntax, semantics and processing instructions that are not already specified by [ACAL]. For more information on the scope, please refer to [ACAL].

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

<!-- The following syntax (: definition) for definition lists requires the 'definition_lists' extension enabled in the pandoc command (-f gfm+definition_lists) to be rendered properly. 

**Term**

: [REF] Definition.
-->

None.

### 2.1.2 Terms Defined in this Document

This document defines the following terms:

<!-- The following syntax (: definition) for definition lists requires the 'definition_lists' extension enabled in the pandoc command (-f gfm+definition_lists) to be rendered properly. 

**Term**

: Definition.

-->
None.

### 2.1.3 Related terms

None.

## 2.2 Abbreviations and Acronyms

This document uses the following abbreviations and acronyms:
<!-- The following syntax (: definition) for definition lists requires the 'definition_lists' extension enabled in the pandoc command (-f gfm+definition_lists) to be rendered properly. 

**Acronym (Full Term)**

: Definition.

-->

---

# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [RFC2119] [RFC8174] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions

<!-- From OASIS Open Specification Template Instructions: Describe any standards or typographical conventions that were followed when writing this document, such as fonts or highlighting that have special significance. If there are no typographical conventions than one is to put "None". -->

This specification contains schema conforming to W3C XML Schema and normative text to describe the syntax and semantics of XML-encoded **_policy_** statements.

```xml
Listings of XACML schema and code listings appear like this.
```

Conventional XML namespace prefixes are used throughout the listings in this specification to stand for their respective namespaces as follows, whether or not a namespace declaration is present in the example:

* The prefix `xacml:` stands for the XACML 4.0 namespace.

* The prefix `ds:` stands for the W3C XML Signature namespace [[DS](#ds)].

* The prefix `xs:` stands for the W3C XML Schema namespace [[XS](#xs)].

* The prefix `xf:` stands for the XPath and XQuery Functions and Operators 3.1 specification namespace [[XF](#xf)].

* The prefix `xml:` stands for the XML namespace https://www.w3.org/XML/1998/namespace.

This specification uses the following typographical conventions in text: `<XACMLElement>`, `<ns:ForeignElement>`, `Attribute`, `Datatype`, `OtherCode`. Terms in **_bold-face italic_** are intended to have the meaning defined in Section 2.


## 3.3 Schema organization and namespaces

The XACML syntax is defined in a schema associated with the following XML namespace:

<!-- Newline to fit on PDF page -->
`urn:oasis:names:tc:xacml:4.0:core:schema`

-------


# 4 Introduction (non-normative)

<!-- All text is normative unless otherwise labeled -->

## 4.1 Requirements

The XML representation should be as aligned as possible with ACAL.

## 4.2 Abstraction Layer

In the case where the native request/response format is specified in XML Schema (e.g. a SAML-conformant PEP), the transformation between the native format and the ACAL context may be specified in the form of an Extensible Stylesheet Language Transformation [[XSLT](#xslt)].

Similarly, in the case where the resource to which access is requested is an XML document, the resource itself may be included in, or referenced by, the request context. Then, through the use of XPath expressions [[XPath](#xpath)] in the policy, values in the resource may be included in the policy evaluation. The use of XPath expressions is not specified here but in the XPath Profile of ACAL.

## 4.3 Example Short Identifier Set

A set of Short Identifiers with the Id `urn:oasis:names:tc:acal:1.0:core:identifiers` is defined by ACAL in the XML Representation according to this specification, for the various identifiers assigned by ACAL, and provided attached to this profile. However, a deployment will usually have need for additional identifiers, especially for locally-defined attributes, so it is usually desirable to define a set of additional short identifiers to use in the deployment, that may import the first set.

The following short-identifier set defines an XML representation of short identifiers for the additional attributes in this example and also imports the standardized set.

```xml
<ShortIdSet xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
  Id="urn:oasis:names:tc:acal:1.0:example:identifiers"/>

  <!-- Include the short identifiers for standard URIs. -->
  <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:core:identifiers</ShortIdSetReference>

  <!-- These are the short identifiers specific to the deployment. -->
  <!-- Attributes -->
  <ShortId Name="patient-number" Value="urn:oasis:names:tc:acal:1.0:example:attribute:patient-number"/>
  <ShortId Name="collection" Value="urn:oasis:names:tc:acal:1.0:example:attribute:collection"/>

</ShortIdSet>
```

Short Identifiers can reuse other Short Identifiers in their values, typically as prefix, for example, given the following short identifiers:
```xml
<ShortId Name="xs" Value="urn:oasis:names:tc:acal:1.0:data-type:"/>
<ShortId Name="string" Value="{xs}string"/>
```

The following `IdentifierType` values are all equivalent and evaluate to the URI of the string data type:
```
"string"
"{string}"
"{xs}string"
```

## 4.4 Changes From the Previous Version

<!-- From OASIS Open Specification Template Instructions: This section is **REQUIRED** and **MUST** be the last numbered subsection in this section. -->

The list of changes from the previous version and any revision history can be found in [Appendix 2](#appendix-2-changes-from-previous-version).


---


# 5 Syntax (normative, with the exception of the schema fragments)

The next sections describe the rules that SHALL be applied for mapping the [ACAL](#acal) agnostic model (UML-based) to [XML schema](#XS) definitions for this XML representation (XACML).
These rules have been applied to produce XACML's core XML schema in [Annex D](#annex-d-xml-schema-normative) (also in the [Core XML schema file](xacml-core-v4.0-schema.xsd) accompanying this document) from [ACAL] core model.

In all XSD definitions from now, the XACML core namespace `urn:oasis:names:tc:xacml:4.0:core:schema` is the default namespace.


## 5.1 Mapping ACAL primitive types 

For each primitive type (stereotyped `<<primitive>>` or `<<enumeration>>`) in [ACAL](#ACAL) model, apply the mapping rules in the next subsections.

### 5.1.1 Primitive types mapped to standard XSD data-types

The ACAL primitive types in the following table have a direct XML equivalent in the XSD standard, provided in the second column, and that is used for the XML representation (the expression `xs:foo` means the `foo` type in W3C [XML schema](#XS) standard):

Table 1: Mapping ACAL primitive types to standard XSD data-types

|ACAL (UML) |XML schema|
|-------|----------|
|String |xs:string |
|Boolean|xs:boolean|
|Double|xs:double|
|Integer|xs:integer|
|NonNegativeInteger|xs:nonNegativeInteger|
|URI|xs:anyURI|
|Name|xs:Name|

### 5.1.2 Restricted String types (UML stereotype `<<restrictedString>>`)

Each ACAL primitive type `FooType` with stereotype `<<restrictedString>>`, i.e. with a given `pattern` property set to a regular expression *<REGEX>*, is mapped to the following XSD definition:

```xml
<xs:simpleType name="FooType">
  <xs:restriction base="xs:string">
    <xs:pattern value="<REGEX without ^$ anchors>"/>
  </xs:restriction>
</xs:simpleType>
```

In XSD, the ^$ anchors are implicit as the pattern is always matched against the whole string, therefore they MUST be omitted from the pattern.


`FooType` may also have a (optional) `minLength` property set to a (strictly) positive integer `N`, in which case the XSD definition becomes:
```xml
<xs:simpleType name="FooType">
  <xs:restriction base="xs:string">
        <xs:pattern value="<REGEX without ^$ anchors>"/>
    <xs:minLength value="<N>"/>
  </xs:restriction>
</xs:simpleType>
```

For example, ACAL `VersionType` translates to the following XSD definition:

```xml
<xs:simpleType name="VersionType">
   <xs:restriction base="xs:string">
      <xs:pattern value="(0|[1-9]\d*)(\.(0|[1-9]\d*)){0,3}"/>
   </xs:restriction>
</xs:simpleType>
```

### 5.1.3 Enum types (UML stereotype `<<enumeration>>`)

Each ACAL enumerated type `FooType` (stereotyped `<<enumeration>>`) with enum values *V1, V2, ... Vn* is mapped to the following XSD definition:

```xml
<xs:simpleType name="FooType">
    <xs:restriction base="xs:string">
        <xs:enumeration value="V1"/>
        <xs:enumeration value="V2"/>
        ...
        <xs:enumeration value="Vn"/>
    </xs:restriction>
</xs:simpleType>
```

For example, ACAL `DecisionType` translates to the following XSD definition:
```xml
<xs:simpleType name="DecisionType">
   <xs:restriction base="xs:string">
      <xs:enumeration value="Permit"/>
      <xs:enumeration value="Deny"/>
      <xs:enumeration value="Indeterminate"/>
      <xs:enumeration value="NotApplicable"/>
   </xs:restriction>
</xs:simpleType>
```

## 5.2 Mapping complex ACAL types (UML stereotype `<<dataType>>`)

For each complex type (stereotyped `<<dataType>>`) in [ACAL](#ACAL) model, apply the mapping rules in the next subsections.

The expression *`xs:foo` type (respectively element)* means the `foo` type (respectively element) defined in W3C [XML schema](#XS) standard.

<a name="anonymized-datatypes"></a>

### 5.2.1 AnyType mapping rule

The ACAL `AnyType` is mapped to the `xs:anyType` type in XML.

**WARNING:** for safety/security reasons, in production, ACAL implementers should add further restrictions to the XML schema and/or enforce security measures in the XML processor to mitigate possible security issues that may occur when allowing any XML type as input. 

### 5.2.2 Single-use empty datatypes

There are complex ACAL datatypes playing the role of *Union* datatype, such as `CombinerInputType`, which are *empty* (no property and no class inheritance) and have as many subtypes as possible types in the *union*. These are usually used once for a property that can take one of multiple alternative types, such as `CombinerInput`. 

Except the `AnyType` already addressed in the previous section, a single-use empty ACAL datatype `FooType` (i.e. used only for one property `P` in the whole ACAL model (e.g. `CombinerInput`) and not to be used in any ACAL extension) SHALL not be mapped to any dedicated XML type, element or attribute in the XSD. The mapping is done only at the level of property `P` (section 5.2.5) to a `xs:choice` of XSD elements corresponding to the subtypes of `FooType`. 

### 5.2.3 ValueType mapping rules

As an exception, if the ACAL complex type is `ValueType` from [ACAL](#ACAL) section 7.23, it is always mapped to the following XSD: 

```xml
<xs:complexType name="ValueType" mixed="true">
  <xs:complexContent mixed="true">
    <xs:extension base="ExpressionType">
      <xs:sequence>
        <xs:any namespace="##any" processContents="lax" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
      <xs:attribute name="DataType" type="IdentifierType" use="optional"/>
      <xs:anyAttribute  namespace="##any" processContents="lax"/>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```

### 5.2.4 Default mapping rules for complex ACAL types (other than ValueType)

If a complex ACAL type `FooType` is not in the previous cases (section 5.2.1, 5.2.2 and 5.2.3), then:

1. If `FooType` is abstract (italicized title in the UML diagram), then:
   * 1.1. If `FooType` is empty (no class inheritance, no property), then:
     - 1.1.1. If and only if `FooType` is used by more than one property in ACAL model (e.g. `ExpressionType`), then map it to the following XSD definition:
       ```xml 
       <xs:complexType name="FooType" abstract="true"/>
       ```
     - 1.1.2. Else (it is single-used) skip it as instructed in section 5.2.2.
  
   * 1.2. Else (`FooType` is not empty, i.e. inherits a type and/or has at least one property):
     - 1.2.1. If  `FooType` inherits from a Datatype `BarType` (Generalization relationship), then:
       + 1.2.1.1. If `BarType` is a single-use empty type as defined in section 5.2.2, `BarType` is not mapped to any XSD type (mapping is done only at the property level), therefore `FooType` (e.g. `PolicyType`) SHALL be mapped to the following XSD definition (not inheriting from `BarType`):
  
          ```xml
          <xs:complexType name="FooType" abstract="true">
            ...property mapping rules (5.2.5) apply...
          </xs:complexType>
          ```

       + 1.2.1.2. Else (`BarType` is not a single-use empty type, therefore is mapped to a dedicated XML type) if `FooType` has no property (e.g. `ForAnyType`), map it to the following XSD element definition (no need for an XSD type):
         
         ```xml
         <xs:element name="Foo" type="BarType" substitutionGroup="Super" abstract="true"/>
         ```
         
         where `Super` is the name of the `SuperType` element and `SuperType` is the closest datatype to `BarType` in `BarType`'s class hierachy (including `BarType` itself) that is used as at least one property's datatype in ACAL model.

	    + 1.2.1.3. Else (`FooType` has at least one property):
  
            ```xml
            <xs:complexType name="FooType" abstract="true">
              <xs:complexContent>
                <xs:extension base="BarType">
                  ...property mapping rules (5.2.5) apply...
                </xs:extension>
              </xs:complexContent>
            </xs:complexType>
            ```

     - 1.2.2. Else (`FooType` does not inherit any type) map `FooType` to the following XSD definition:

       ```xml
       <xs:complexType name="FooType" abstract="true">
         ...property mapping rules (5.2.5) apply...
       </xs:complexType>
       ```
2. Else (`FooType` is not abstract) apply the same mapping rules as in the first case, except remove `abstract="true"` from the `xs:complexType` and `xs:element` definitions.

3. If `FooType` has a UML *link* (kind of *Association*) via its property *keyRefProp* to another type `BarType`'s property *keyProp* (e.g. a reference to a BarType instance via its identifier), then add a `<xs:keyRef>` element as defined in section 3.11.2 of [[XS](#xs11)] (Identity-constraint Definitions), into the XML element declaration of the root object type (*RootObjectType*) enclosing the property(ies) of type *FooType* and *BarType* (created previously), as follows:
   ```xml
   <xs:element name="RootObject" ...>
     ...
     <!-- The xs:key should already be declared from mapping BarType before FooType.  -->
     <xs:key name="RootObject_Bar_keyProp">
       <xs:selector xpath="<XPath_to_Bar_element>" />
       <xs:field xpath="@keyProp" />
     </xs:key>

     <!-- New keyRef -->
     <xs:keyref name="RootObject_Foo_keyRefProp" refer="RootObject_Bar_keyProp">
       <xs:selector xpath="<XPath_to_Foo_element>" />
       <xs:field xpath="@keyRefProp" />
     </xs:keyref>
   </xs:element>
   ```
   where `<XPath_to_Foo_element>` is the XPath expression to select the *Foo* element of `FooType`.
   
4. If `FooType` has *Object-level constraints* as defined in section 7.1.1.1.2 of [[ACAL](#acal)], implementers SHOULD apply the recommended mappings in the section [5.2.6](#526-mapping-complex-acal-constraints-ocl), or they MAY also apply alternative implementation-specific mapping mechanisms as they see fit.

### 5.2.5 Property mapping rules

Inside the `xs:complexType` or `xs:extension` element created by the previous mapping rules, go the property mappings for each property *Prop* of the complex ACAL type. Let *PropType* be *Prop*'s datatype.

1. If *Prop* has special name `<any>` (and special type `AnyType`) in ACAL, then map the property to the following XSD definition (replace *{min}* with the lower bound of *Prop*'s multiplicity in the ACAL (UML) model, and *{max}* with the upper bound, using `unbounded` as equivalent for `*`):
   ```xml
   <xs:sequence>
		<xs:any namespace="##any" processContents="lax" minOccurs="{min}" maxOccurs="{max}"/>
	 </xs:sequence>
   ```

2. Else if *PropType* is a primitive type, then:
   
   - 2.1. Map *PropType* to a XSD type according to mapping rules of section 5.1. The obtained XSD type is referred to as `PropXsdType` in the next steps.
   - 2.2. If *PropType* is other than (unrestricted) `String` (it may be a restricted String type as in section 5.1.2) AND single-valued (the upper bound of the multiplicity is 1), then map to an XML attribute as follows (if *Prop*'s multiplicity is `0..1`, replace `$use` with `optional`, else with `required`):

     ```xml
     <xs:attribute name="Prop" type="PropXsdType" use="$use"/>
     ```
     If *Prop* has a default value `$default`, then add the `default` attribute:
     ```xml
     <xs:attribute name="Prop" type="PropXsdType" use="$use" default="$default"/>
     ```
   - 2.3. Else (if *PropType* is `String` (unrestricted, i.e. not a derived type) or multi-valued), then:
        
     Define a global element named *Prop* in XACML namespace:

     ```xml
     <xs:element name="Prop" type="PropXsdType"/>
     ```
     
     If this is the first property in the datatype, then create  a `<xs:sequence>`. 

     Add an element reference to the *Prop* global element above inside the `<xs:sequence>` as follows (replace `$min` with the lower bound and `$max` with the upper bound of *Prop*'s multiplicity in the ACAL (UML) model, using `unbounded` as equivalent for `*`):

        ```xml
        <xs:sequence>
           ...other properties mapped to elements...
           <xs:element ref="Prop" minOccurs="$min" maxOccurs="$max"/>
           ...other properties mapped to elements...
        </xs:sequence>
        ```

   - 2.4. If *Prop* is multivalued and has a *simple uniqueness constraint* as defined in section 7.1.1.1.1.1 of [ACAL], i.e. a UML `unique` annotation, then add an `<xs:key>` element as defined in section 3.11.2 of [[XS](#xs11)] (Identity-constraint Definitions), into the XML element declaration of the root object type enclosing *Prop* (created previously), as follows:
  
     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        ...
        <xs:key name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="." />
        </xs:key>
     </xs:element>
     ```

     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.
   
3. Else if *PropType* is a *single-use empty type* as defined in Section 5.2.2 (e.g.`CombinerInputType`), i.e. an empty abstract type only used by *Prop* in the ACAL model, with subtypes *Sub1Type, Sub2Type, etc.*, then for each subtype *SubXType* of *PropType*, apply the mapping rules in the previous section and this section to *SubXType*, and create an element `<xs:element name="SubX" type="SubXType" />` in XACML namespace if it does not already exist (`<xs:element name="SubX" type="SubXType" abstract="true"/>` if *SubXType* is abstract). Then *PropType* maps to the following XSD definition (replace `$min` with the lower bound of *Prop*'s multiplicity in the ACAL (UML) model, and `$max` with the upper bound, using `unbounded` as equivalent for `*`):
   
   ```xml
   <xs:choice minOccurs="$min" maxOccurs="$max">
      <xs:element ref="Sub1"/>
      <xs:element ref="Sub2"/>
      ...
   </xs:choice>
   ``` 

4. Else (*PropType* is not a single-use empty type), apply the mapping rules in the previous section and this section to *PropType*, then:
   
   - 4.1. Define a global element named `Prop` of type `PropType` in XACML namespace if it does not already exist:
  
     ```xml
     <xs:element name="Prop" type="PropType"/>
     ```
     If `PropType` is abstract, add the `abstract="true"` attribute:

     ```xml
     <xs:element name="Prop" type="PropType" abstract="true"/>
     ``` 

     If `PropType` inherits from a type `BarType`, apply the mapping rules in the previous section and this section to `BarType` if the XSD type `BarType` is not already defined, then create a global element named `Bar` of type `BarType` in XACML namespace by re-appling this same rule 4.1 with `Bar` as *Prop* and `BarType` as *PropType*, if the element `Bar` does not already exist. Then add *Prop* element to `Bar` substitution group:

     ```xml
     <xs:element name="Prop" type="PropType" substitutionGroup="Bar"/>
     ```
        
   - 4.2. Map *Prop* to the following XSD definition (replace `$min` with the lower bound of *Prop*'s multiplicity in the ACAL (UML) model, and `$max` with the upper bound, using `unbounded` as equivalent for `*`):
  
     ```xml
     <xs:sequence>
       ...other properties mapped to elements...
       <xs:element ref="Prop" minOccurs="$min" maxOccurs="$max"/>
       ...other properties mapped to elements...
     </xs:sequence>
     ```

   - 4.3. If *Prop* has a *mandatory-property-based uniqueness constraint* as defined in section 7.1.1.1.1.2 of [ACAL], i.e. `self->isUnique(itemProp)`, then add an `<xs:key>` element as defined in section 3.11.2 of [[XS](#xs11)] (Identity-constraint Definitions), into the XML element of the root object type enclosing *Prop* (created previously), as follows (such `itemProp` is always mapped to an XML attribute in this case):
  
     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        <xs:key name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="@itemProp" />
        </xs:key>
     </xs:element> 
     ```
     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

   - 4.4 Else if *Prop* has a *optional-property-based uniqueness constraint* as defined in section 7.1.1.1.1.2 of [ACAL], i.e. `self->select(itemProp <> null)->isUnique(itemProp)`, then add an `<xs:unique>` element as defined in section 3.11.2 of [[XS](#xs11)] (Identity-constraint Definitions), into the XML element of the root object type enclosing *Prop* (created previously), as follows (such `itemProp` is always mapped to an XML attribute in this case):
  
     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        <xs:unique name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="@itemProp" />
        </xs:unique>
     </xs:element>
     ```

     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

   - 4.5. Else if *Prop* has a *multi-property-based uniqueness constraint* as defined in section 7.1.1.1.1.2 of [ACAL], i.e. ` self->isUnique(Sequence{itemProp1, itemProp2, ...})`, then add an `<xs:unique>` element as defined in section 3.11.2 of [[XS](#xs11)] (Identity-constraint Definitions), into the XML element of the root object type enclosing *Prop* (created previously), as follows (such `itemProp1`, `itemProp2`, etc. are always mapped to XML attributes in this case):
  
     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        <xs:unique name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="@itemProp1" />
          <xs:field xpath="@itemProp2" />
          ...
        </xs:unique>
     </xs:element> 
     ```

     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

   - 4.6. Else if *Prop* has other kinds of constraints defined in section 7.1.1.1.1.2 of [ACAL] not mentioned previously, implementers SHOULD apply the recommended mappings in the next section, or they MAY also apply alternative implementation-specific mapping mechanisms as they see fit.

### 5.2.6 Mapping complex ACAL constraints (OCL)

_*This section is non-normative.*_ 

The following kinds of OCL-defined UML constraints in the [ACAL](#acal) model do not have any equivalent in [[XSD 1.0](#xs)]:

- Some of the OCL-defined property-level constraints in [ACAL] section 7.1.1.1.1.2:
  - Multivalued-property-based uniqueness constraint;
  - Value type uniqueness constraint.
- All object-level constraints in [ACAL] section 7.1.1.1.2.

This document does not mandate a particular method to map and/or implement these more complex constraints, and leaves this part of the specification implementation-defined. Instead, this document provides only an implementation guidance that recommends to possible options described in the next sections:

- Option 1: [[XSD 1.1](#xs11)] schema with XML Schema 1.1 *assertions*;
- Option 2: [[XSD 1.0](#xs)] schema with [ISO Schematron](#schematron) rules.


#### 5.2.6.1 Option 1: XML Schema 1.1 assertions

Implementations supporting [W3C XML Schema 1.1](#xs11) standard SHOULD use XSD 1.1 assertions as defined in section 3.13 of XSD 1.1 standard to implement the aforementioned constraints. The general mapping rule consists for each constraint specified on a ACAL Datatype `FooType` or one of its properties, to define an equivalent XSD 1.1 assertion `<xs:assert test="expression"/>` - where *expression* is the XPath equivalent of the OCL constraint expression - inside the `xs:complexType` definition of `FooType`.

The equivalent XSD 1.1 assertions are already defined in the *Core XML schema* accompanying this document (`<xs:assert>` elements). However, certain generic assertions may be problematic for certain XSD 1.1 / XPath engines or use cases, in which case alternative assertions are suggested in XML comments before or after each possibly problematic `<xs:assert>` element currently in use in the schema. Implementers SHOULD review these before use.

Moreover, implementers MAY choose to replace some of the assertions with possibly more optimal implementations as long as they provide equivalent constraint enforcement.

For information only, the following table suggests generic mappings for some of the aforementioned complex UML constraints used in ACAL model:

**Table 2:** ACAL/UML constraints mapped to [[XSD 1.1](#xs11)] assertions

| ACAL constraint's OCL expression | XSD 1.1 assertion's XPath expression |
| :--- | :--- |
| `X or Y` <br> *(X, Y can be any of the predicates below)* | `X or Y` |
| `prop <> null` <br> *(`prop` is single-valued)* | `prop` <br> *(the `prop` element occurs)* |
| `prop = null` <br> *(`prop` is single-valued)* | `not(prop)` <br> *(no `prop` element occurs)* |
| `prop->notEmpty()` <br> *(`prop` is multivalued)* | `prop` <br> *(at least one `prop` element occurs)* |

You may find further guidance about XSD-1.1-based validation on [OASIS XACML TC's code repository](https://github.com/oasis-tcs/xacml-spec/).


#### 5.2.6.2 Option 2: Schematron rules

Due to the current general lack of adoption of XSD 1.1 (and limited availability of implementations), implementations only supporting XSD 1.0 MAY achieve the same result by combining the following: 

- An XSD 1.0 version of the *Core XML Schema*, obtained by filtering out all the schema elements with attribute `vc:minVersion="1.1"` (according to [XSV]) from the XSD 1.1 schema (e.g. with an [XSLT] stylesheet);
- [ISO Schematron](#schematron) rules provided with this document (file with `.sch` extension), that implement the complex OCL constraints with similar - if not the same - XPath expressions as the XSD 1.1 assertions in the previous Option 1. Therefore, like XSD 1.1 assertions, certain generic Schematron assertions may be problematic for certain XSLT / XPath engines or use cases, in which case alternative assertions are suggested in XML comments before or after each possibly problematic `<assert>` element currently in use in the schema. Implementers SHOULD review these before use. Moreover, implementers MAY choose to replace some of the assertions with possibly more optimal implementations as long as they provide equivalent constraint enforcement. Each Schematron `pattern` element has the corresponding  [ACAL] model's UML constraint (with OCL expression) reminded in the child `title` element. You may find further guidance about Schematron-based validation on [OASIS XACML TC's code repository](https://github.com/oasis-tcs/xacml-spec/).

## 5.3 Content Types and Body representations (optional)

Although this specification defines an XML representation, both XML and non-XML data may be represented in a `<Content>` element (corresponding to an ACAL `ContentType` object).
This specification defines the following `Content` types in order to support ACAL Profiles with AttributeSelector and/or DataType extensions based on such Content (e.g. XPath and JSONPath Profiles):

- XML document:
  - `MediaType` attribute SHALL be set to `application/xml` (default value);
  - `Encoding` attribute unused;
  - `Body` element has only a single child element that is the XML document itself.

- JSON object *(note that a JSON array can be wrapped in a JSON object if there is a need to support JSON arrays)*:
  - `MediaType` attribute SHALL be `application/json`;
  - `Encoding` attribute unused;
  - `Body` element has only a text node that contains the JSON object, either escaped to fit in a simple XML string, or unescaped in a XML CDATA section as follows:
    ```xml
    <Body>
      <![CDATA[
        ... JSON object ...
      ]]>
    </Body>
    ```

The implementation SHALL support a given content type in this list if and only if there is an ACAL Profile that makes it mandatory (refer to the Profile's specification for more information).

-------

# 6 Safety, Security and Privacy Considerations (non-normative)

<!-- From OASIS Open Specification Template Instructions:


This section is **REQUIRED** and **MUST** be the second to last numbered section in the document, right before Conformance. This section contains information about safety, security, data protection, and privacy considerations. These can be divided up into separate subsections as desired. All documents **SHOULD** have at least a security and data protection considerations section, and otherwise **MUST** have a blank section indicating “None.” Any other considerations **MAY** also be added.


Please note that any specification that will need to register something with IANA or has plans to go on to ITU/ISO/IEC **MUST** have this section filled out. For an example please see the following section in the CACAO specification here [https://docs.oasis-open.org/cacao/security-playbooks/v2.0/cs01/security-playbooks-v2.0-cs01.html\#\_Toc152256574](https://docs.oasis-open.org/cacao/security-playbooks/v2.0/cs01/security-playbooks-v2.0-cs01.html#_Toc152256574) 


-->

This section identifies possible security and privacy compromise scenarios that should be considered when implementing this profile. The section is informative only. It is left to the implementer to decide whether these compromise scenarios are practical in their environment and to select appropriate safeguards.

## 6.1 Threat model

Refer to [ACAL](#acal) section 11.1.

## 6.2 Safeguards

Refer to [ACAL](#acal) section 11.2 for general considerations.

### 6.2.1 Policy confidentiality

Where the policy is represented in XML Representation defined by this profile, the *XML Encryption Syntax and Processing Candidate Recommendation* from W3C can be used to encrypt all or parts of an XML document. This specification is recommended for use with XACML.

### 6.2.2 Policy integrity

The selection of the appropriate mechanisms is left to the implementers. However, when **_policy_** is distributed between organizations to be acted on at a later time, or when the **_policy_** travels with the protected **_resource_**, it would be useful to sign the **_policy_**. In these cases and when the XML representation of policies (according to this profile) is used, the *XML Signature Syntax and Processing standard* from W3C is recommended to be used with XACML.

-------

# 7 Conformance

<!-- From OASIS Open Specification Template Instructions: 


This section is **REQUIRED** and **MUST** be the last numbered section in the document. 


-->

## 7.1 Introduction

The XACML specification addresses the following aspect of conformance:

The XACML specification defines a number of functions, etc. that have somewhat special applications, therefore they are not required to be implemented in an implementation that claims to conform with the OASIS standard.

## 7.2 Conformance tables

This section lists those portions of the specification that MUST be included in an implementation of a **_PDP_** that claims to conform to XACML 4.0. A set of test cases has been created to assist in this process. These test cases can be located from the OASIS XACML TC Web page. The site hosting the test cases contains a full description of the test cases and how to execute them.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-syntax-normative-with-the-exception-of-the-schema-fragments) and [Annex C](#annex-c-xacml-identifiers-normative) where they apply to implemented items in the following tables.

### 7.2.1 Schema elements

The implementation MUST support those schema elements in the XACML core namespace (`urn:oasis:names:tc:xacml:4.0:core:schema`) that are marked `M`.

| Element name                  | M/O |
|:------------------------------|:----|
| Apply                         | M   |
| ApplicablePolicyReference     | O   |
| Attribute                     | M   |
| AttributeAssignment           | M   |
| AttributeAssignmentExpression | M   |
| AttributeDesignator           | M   |
| AttributeSelector             | O   |
| Bundle                        | O   |
| Category                      | M   |
| Condition                     | M   |
| Content                       | O   |
| Description                   | M   |
| EntityAttributeDesignator     | O   |
| EntityAttributeSelector       | O   |
| Expression                    | M   |
| ForAll                        | O   |
| ForAny                        | O   |
| Function                      | M   |
| Map                           | O   |
| MissingAttributeDetail        | M   |
| MultiRequests                 | O   |
| Notice                        | M   |
| NoticeExpression              | M   |
| Policy                        | M   |
| PolicyDefaults                | O   |
| PolicyReference               | M   |
| PolicyIssuer                  | O   |
| PolicyPatternMatchReference   | O   |
| Request                       | M   |
| RequestAttribute              | M   |
| RequestDefaults               | O   |
| RequestEntity                 | M   |
| RequestEntityReference        | O   |
| RequestReference              | O   |
| Response                      | M   |
| Result                        | M   |
| ResultEntity                  | M   |
| Rule                          | M   |
| Select                        | O   |
| SharedVariableDefinition      | O   |
| SharedVariableReference      | O   |
| ShortId                       | M   |
| ShortIdSet                    | M   |
| ShortIdSetReference           | M   |
| Status                        | M   |
| StatusCode                    | M   |
| StatusDetail                  | O   |
| StatusMessage                 | O   |
| Target                        | M   |
| Value                         | M   |
| VariableDefinition            | M   |
| VariableReference             | M   |

-------


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


This document is provided under the [RF on Limited Terms](https://www.https:policies-guidelines/ipr/#RF-on-Limited-Mode) IPR mode that was chosen when the project was established, as defined in the IPR Policy. For information on whether any patents have been disclosed that may be essential to implementing this document, and any offers of patent licensing terms, please refer to the Intellectual Property Rights section of the project’s web page ([https://www.oasis-open.org/committees/xacml/ipr.php](https://www.oasis-open.org/committees/xacml/ipr.php)).


This document and the information contained herein is provided on an "AS IS" basis and OASIS DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION HEREIN WILL NOT INFRINGE ANY OWNERSHIP RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. OASIS AND ITS MEMBERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THIS DOCUMENT OR ANY PART THEREOF.


As stated in the OASIS IPR Policy, the following three paragraphs in brackets apply to OASIS Standards Final Deliverable documents (Committee Specifications, OASIS Standards, or Approved Errata).


OASIS requests that any OASIS Party or any other party that believes it has patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable, to notify OASIS TC Administrator and provide an indication of its willingness to grant patent licenses to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this deliverable.


OASIS invites any party to contact the OASIS TC Administrator if it is aware of a claim of ownership of any patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable by a patent holder that is not willing to provide a license to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this OASIS Standards Final Deliverable. OASIS may include such claims on its website, but disclaims any obligation to do so.


OASIS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this OASIS Standards Final Deliverable or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on OASIS' procedures with respect to rights in any document or deliverable produced by an OASIS Technical Committee can be found on the OASIS website. Copies of claims of rights made available for publication and any assurances of licenses to be made available, or the result of an attempt made to obtain a general license or permission for the use of such proprietary rights by implementers or users of this OASIS Standards Final Deliverable, can be obtained from the OASIS TC Administrator. OASIS makes no representation that any information or list of intellectual property rights will at any time be complete, or that any claims in such list are, in fact, Essential Claims.


The name "OASIS" is a trademark of OASIS, the owner and developer of this document, and should be used only to refer to the organization and its official outputs. OASIS welcomes reference to, and implementation and use of, its documents, while reserving the right to enforce its marks against misleading uses. Please see [https://www.oasis-open.org/policies-guidelines/trademark/](https://www.oasis-open.org/policies-guidelines/trademark/) for guidance.


---


# Annex B References

(This annex forms an integral part of this Specification.)

This section contains the normative and informative references that are used in this document. 

Normative references are specific (identified by date of publication and/or edition number or version number) and Informative references are either specific or non-specific. For specific references, only the cited version applies. For non-specific references, the latest version of the reference document (including any amendments) applies. While any hyperlinks included in this section were valid at the time of publication, OASIS cannot guarantee their long term validity.

## B.1 Normative References

<!-- (Reference sources:
For references to IETF RFCs, use the approved citation formats at:  
https://docs.oasis-open.org/templates/ietf-rfc-list/ietf-rfc-list.html. 

For references to W3C Recommendations, use the approved citation formats at: 
https://docs.oasis-open.org/templates/w3c-recommendations-list/w3c-recommendations-list.html.  
Remove this note before submitting for publication.
-->

The following documents are referenced in such a way that some or all of their content constitutes requirements of this document.

######  [ACAL]

Attribute-Centric Authorization Language (ACAL) Version 1.0. Edited by Steven Legg and Cyril Dangerville. 17 February 2026. OASIS Committee Specification Draft 01.

###### [CMF]

Martin J. Dürst et al, eds., Character Model for the World Wide Web 1.0: Fundamentals, W3C Recommendation 15 February 2005, https://www.w3.org/TR/2005/REC-charmod-20050215/

###### [DS]

D. Eastlake et al., XML-Signature Syntax and Processing, https://www.w3.org/TR/xmldsig-core/, World Wide Web Consortium.

###### [exc-c14n]

J. Boyer et al, eds., Exclusive XML Canonicalization, Version 1.0, W3C Recommendation 18 July 2002, https://www.w3.org/TR/2002/REC-xml-exc-c14n-20020718/

###### [Hancock]

Hancock, Polymorphic Type Checking, in Simon L. Peyton Jones, Implementation of Functional Programming Languages, Section 8, Prentice-Hall International, 1987.

###### [Hier]

XACML v3.0 Hierarchical Resource Profile Version 1.0. 11 March 2010. Committee Specification Draft 03. https://docs.oasis-open.org/xacml/3.0/xacml-3.0-hierarchical-v1-spec-cd-03-en.html

###### [IEEE754]

IEEE Standard for Binary Floating-Point Arithmetic 1985, ISBN 1-5593-7653-8, IEEE Product No. SH10116-TBR.

###### [INFOSET]

XML Information Set (Second Edition), W3C Recommendation, 4 February 2004, https://www.w3.org/TR/xml-infoset/

###### [ISO10181-3]

ISO/IEC 10181-3:1996 Information technology – Open Systems Interconnection -- Security frameworks for open systems: Access control framework.

###### [Kudo00]

Kudo M and Hada S, XML document security based on provisional authorization, Proceedings of the Seventh ACM Conference on Computer and Communications Security, Nov 2000, Athens, Greece, pp 87-96.

###### [LDAP-1]

RFC2256, A summary of the X500(96) User Schema for use with LDAPv3, Section 5, M Wahl, December 1997, https://www.ietf.org/rfc/rfc2256.txt

###### [LDAP-2]

RFC2798, Definition of the inetOrgPerson, M. Smith, April 2000, https://www.ietf.org/rfc/rfc2798.txt

###### [MathML]

Mathematical Markup Language (MathML), Version 2.0, W3C Recommendation, 21 October 2003, https://www.w3.org/TR/2003/REC-MathML2-20031021/

###### [Multi]

OASIS Committee Draft 03, XACML v3.0 Multiple Decision Profile Version 1.0, 11 March 2010, https://docs.oasis-open.org/xacml/3.0/xacml-3.0-multiple-v1-spec-cd-03-en.doc

###### [Perritt93]

Perritt, H. Knowbots, Permissions Headers and Contract Law, Conference on Technological Strategies for Protecting Intellectual Property in the Networked Multimedia Environment, April 1993. Available at: https://www.cni.org/resources/historical-resources/technological-strategies-for-protecting-intellectual-property-in-the-networked-multimedia-environment/permission-headers-and-contract-law

###### [RBAC]

David Ferraiolo and Richard Kuhn, Role-Based Access Controls, 15th National Computer Security Conference, 1992.

###### [RFC2119]

Bradner, S., "Key words for use in RFCs to Indicate Requirement Levels", BCP 14, RFC 2119, DOI 10.17487/RFC2119, March 1997, https://www.rfc-editor.org/info/rfc2119.

###### [RFC2396]

RFC 2396, Berners-Lee T, Fielding R, Masinter L, Uniform Resource Identifiers (URI): Generic Syntax, https://www.ietf.org/rfc/rfc2396.txt

###### [RFC2732]

RFC 2732, Hinden R, Carpenter B, Masinter L, Format for Literal IPv6 Addresses in URL's,  https://www.ietf.org/rfc/rfc2732.txt

###### [RFC3198]

IETF RFC 3198: Terminology for Policy-Based Management, November 2001. https://www.ietf.org/rfc/rfc3198.txt

###### [RFC8174]

Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP 14, RFC 8174, DOI 10.17487/RFC8174, May 2017, https://www.rfc-editor.org/info/rfc8174.

###### [Schematron]

ISO/IEC 19757-3:2025, Information technology — Document Schema Definition Languages (DSDL) - Part 3: Rule-based validation using Schematron, Edition 4, September 2025. Online: https://www.iso.org/standard/85625.html.

###### [UAX15]

Mark Davis, Martin Dürst, Unicode Standard Annex #15: Unicode Normalization Forms, Unicode 5.1, https://unicode.org/reports/tr15/

###### [UTR36]

Davis, Mark, Suignard, Michel, Unicode Technical Report #36: Unicode Security Considerations, https://www.unicode.org/reports/tr36/

###### [XACMLAdmin]

OASIS Committee Draft 03, XACML v3.0 Administration and Delegation Profile Version 1.0. 11 March 2010, https://docs.oasis-open.org/xacml/3.0/xacml-3.0-administration-v1-spec-cd-03-en.doc

###### [XACMLv1.0]

OASIS Standard, Extensible access control markup language (XACML) Version 1.0. 18 February 2003, https://www.oasis-open.org/committees/download.php/2406/oasis-xacml-1.0.pdf

###### [XACMLv1.1]

OASIS Committee Specification, Extensible access control markup language (XACML) Version 1.1. 7 August 2003, https://www.oasis-open.org/committees/xacml/repository/cs-xacml-specification-1.1.pdf

###### [XF]

W3C XQuery, XPath, and XSLT Functions and Operators Namespace Document (XPath and XQuery Functions and Operators 3.1) 21 March 2017, https://www.w3.org/2005/xpath-functions/

###### [XML]

Bray, Tim, et.al. eds, Extensible Markup Language (XML) 1.0 (Fifth Edition), W3C Recommendation 26 November 2008, https://www.w3.org/TR/2008/REC-xml-20081126/

###### [XMLid]

Marsh, Jonathan, et.al. eds, xml:id Version 1.0. W3C Recommendation 9 September 2005, https://www.w3.org/TR/2005/REC-xml-id-20050909/

###### [XPath]

XML Path Language (XPath) 3.1, W3C Recommendation 21 March 2017, https://www.w3.org/TR/xpath-31/

###### [XPathFunc]

W3C XQuery, XPath, and XSLT Functions and Operators Namespace Document (XPath and XQuery Functions and Operators 3.1) 21 March 2017, https://www.w3.org/2005/xpath-functions/


###### [XS]

XML Schema 1.0, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema-1/ and https://www.w3.org/TR/xmlschema-2/

###### [XS11]

XML Schema 1.1, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema11-1/ and https://www.w3.org/TR/xmlschema11-2/

###### [XSLT]

XSL Transformations (XSLT) Version 1.0, W3C Recommendation 16 November 1999, https://www.w3.org/TR/xslt/

###### [XSV]

W3C, XML Schema Versioning namespace, August 2007. Online: https://www.w3.org/2007/XMLSchema-versioning/


## B.2 Informative References

The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [CM]

Character Model for the World Wide Web: String Matching W3C Working Group Note 11 August 2021, https://www.w3.org/TR/charmod-norm/, World Wide Web Consortium.

###### [Hinton94]

Hinton, H, M, Lee, E, S, The Compatibility of Policies, Proceedings 2nd ACM Conference on Computer and Communications Security, Nov 1994, Fairfax, Virginia, USA.

###### [Sloman94]

Sloman, M. Policy Driven Management for Distributed Systems. Journal of Network and Systems Management, Volume 2, part 4. Plenum Press. 1994.

-------


# Annex C. XACML identifiers (normative)

This section defines standard identifiers for commonly used entities.

## C.1 XACML namespaces

XACML is defined using this identifier:

`urn:oasis:names:tc:xacml:4.0:core:schema`

-------

# Annex D. XML Schema (normative)

This section includes the XML Schema for the XACML syntax defined in this specification, more particularly in section 5 (i.e. obtained by applying the ACAL-to-XML mapping rules):

```xml 
!include`xslt="pandoc/remove-comments.xsl"` xacml-core-v4.0-schema.xsd
```

-------


# Appendix 1. Acknowledgments

(This appendix does not form an integral part of this Specification and is informational.)


<!-- From OASIS Open Specification Template Instructions:


All parts in this appendix are optional to the TC. Individuals or companies, past or present, may request that their name and/or affiliation is not included in this list. 


-->


## Leadership


The following individuals have had significant leadership positions during the development of this document, not just this version of the document, and they are gratefully acknowledged:

<!-- From OASIS Open Specification Template Instructions:

This section **SHOULD** include the leadership (chairs, sub committees chairs, secretaries, editors, etc.) of this document, and not just for this version of the document, even if they are no longer members of the TC.

-->

- Chairs
  - Bill Parducci, Individual
- Secretaries
  - Bill Parducci, Individual
- Editors
  - Steven Legg, ViewDS Identity Solutions
  - Cyril Dangerville, THALES


## Special Thanks

<!-- This is an optional subsection to call out contributions from TC members. If a TC wants to thank non-TC members then they should avoid using the term "contribution" and instead thank them for their "expertise" or "assistance". -->

Substantial contributions to this document from the following individuals are gratefully acknowledged:

Steven Legg, ViewDS Identity Solutions \
Cyril Dangerville, THALES

## Participants

<!-- A TC can determine who they list here, however, TC Observers must not be listed. It is common practice for TCs to list everyone that was part of the TC during the creation of the document, but this is ultimately a TC decision on who they want to list and not list, and in what order. -->

The following individuals were members of this committee during the creation of this document, not just this version of the document, and their contributions are gratefully acknowledged:

**XACML TC Members:**

- Bill | Parducci, Individual
- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES

-------

# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)

<!-- From OASIS Open Specification Template Instructions: 

The appendix **SHOULD** contain any explanatory text about the reason for this version including any major changes. The level of detail that is included in this appendix is up to the editors and chairs of the TC to determine. This appendix is **REQUIRED**, if there are no changes then one is to put "None." In addition to any descriptive text, all major changes **SHOULD** be in a bulleted list so that reviewers and implementers can easily understand what they need to know.

-->

XACML 4.0 differs from XACML 3.0 in the following ways:

- The policy (`Policy`) and policy set (`PolicySet`) constructs have been merged into a single construct which is known as a policy (`Policy`) in ACAL 1.0.

  - Compared to XACML 3.0, the `<PolicySet>`, `<PolicySetIdReference>`, `<PolicySetCombinerParameters>` and `<PolicySetDefaults>` elements and `PolicySet` type no longer appear.

  - Compared to XACML 3.0, the `PolicyType` type now allows child `<Policy>` and `<PolicyReference>` (was `PolicyIdReference`) elements.

  - Compared to XACML 3.0, a `Policy` may contain more than one `PolicyDefaults` element, one per ACAL Profile possibly. 
  
  -  EarliestVersion and LatestVersion attributes removed from `<PolicyReference>`

- The target (`Target` element) of a policy has been changed to have the same structure as the condition of a rule (i.e., a single Boolean expression). From the XML perspective, this means that the `<AnyOf>`, `<AllOf>` and `<Match>` elements no longer appear.

- Rules no longer have a target (`Target` element removed).

- Obligations and advice no longer have distinct syntactic representations. Instead they now share the common `NoticeType` object type. The difference between obligations and advice is indicated by an `IsObligation` property. (XML elements `ObligationExpressions`, `ObligationExpression`, `Obligations`, `Obligation`, `AdviceExpressions`, `AdviceExpression`, `AssociatedAdvice`, `Advice` replaced with `NoticeExpression` and `Notice`.)

- Combiner parameters are no longer supported and the `<CombinerParameter>`, `<CombinerParameters>`, `<PolicyCombinerParameters>` and `<RuleCombinerParameters>` elements no longer appear.

- Users are able to define short identifiers (`ShortIdSet` objects), which provide simple alias names to use in place of absolute URIs to refer to ACAL definitions. A predefined set of short identifiers for standard-defined URIs is also provided.

- The `IncludeInResult` XML attribute of the `<Attribute>` element has been prohibited in results and entity data type values. It is meaningless in these cases.

- `IncludeInResult`, `ReturnPolicyIdList` and `CombinedDecision` attributes (in a `Request`) are now optional with default value `false`.

- A `Request` may contain more than one `RequestDefaults` element, one per ACAL Profile possibly.

- Different types are now used to represent attribute categories in a request versus a response. Categories in the result don't have the `Content` property, since there is no mechanism to request their inclusion, and their attributes don't have the `IncludeInResult` property because it is meaningless in that context. Categories in the request have both `Content` properties and attributes with `IncludeInResult` properties. Attribute categories in the request are `RequestEntityType` objects and attributes in the response are `ResultEntityType` objects. These types supersede the XML Schema `AttributesType` complex type. As a result:

  - `Attributes` element replaced with new `RequestEntity` and `ResultEntity` elements in the `Request` and `Result` elements respectively
  - `AttributesReference` replaced with new `RequestEntityReference`.

- `Attribute` has a new optional `DataType` attribute (set to the standard string type as default), to have a common data-type for all the attribute values. In XACML 3.0, defining the data-type for each `AttributeValue` individually led to the risk of mixing different datatypes in the same attribute. We consider this bad practice (one may simply split in different attributes if using different data-types).

- `AttributeValue` is replaced with more generic `Value` whose `DataType` is now optional, i.e. it may be omitted when it is already defined by at the parent or ancestor level, which simplifies expressions with literal values. In particular, as a result of the previous change, in an `Attribute`, the `Value`'s `DataType` is now omitted since defined at the `Attribute` level already.

- `Content` may now contain XML, JSON and possibly other content types in the future, and therefore has a new data model - more generic - that consists of a `Body` element (content body which is similar to former Content value) and two attributes: `MediaType` (Content media type which indicates whether it is XML, JSON or some other content type) and `Encoding` (indicates whether the body is encoded with a particular mechanism, e.g. Base64-encoded data).

- `AttributeSelector` changes:
  
  - `DataType` attribute changed to be optional with the standard string type as default value to simplify the element declaration in most cases.
   * `MustBePresent`: changed to be optional with `false` as default value, to simplify the element declaration in most cases.
   * `AttributeSelector` and `Path` type of expression are abstract in ACAL model, concrete types of AttributeSelector Path expressions to be defined in ACAL Profiles, e.g. XPath Profile.

- `AttributeDesignator` changes to simplify the declaration in most cases: 

  * `DataType` attribute changed to be optional, with the standard string type as default.
  * `MustBePresent`: changed to be optional with `false` as default value.

- The `xml:id` attribute for an attribute category is replaced by a generic 'Id' property so that all ACAL representation formats are on an equal footing.

- The quantified expressions (`ForAny`, `ForAll`, `Select` and `Map`) and the `entity` data type from the XACML 3.0 Entities Profile [[ENTITIES](#entities)] have been incorporated in ACAL version 1.0. The `attribute-designator` function from the profile has been reinvented as the `EntityAttributeDesignatorType` expression object type and the `attribute-selector` function from the the profile has been reinvented as the `EntityAttributeSelectorType` expression object type.

- Added new `BundleType` object which allows to bundle variable definitions (`SharedVariableDefintion`), short identifiers (`ShortIdSet`) and policies together in order to be portable / reused from one ACAL system to another, more particularly one PDP to another.
- Changed `Decision` element to an XML attribute in `Result`.

- XPath features moved to separate ACAL XPath Profile: XPath-based AttributeSelector, XPath-based functions, XPath expression datatype.

- Deprecated prefixes `urn:oasis:names:tc:xacml:` and `https://www.w3.org/2001/XMLSchema#` in favor of `urn:oasis:names:tc:acal:` for all standard identifiers (algorithms, status codes, data-types, functions, attributes and categories)

## Revision History

Latest revision history can be obtained from [OASIS XACML TC's code repository](https://github.com/oasis-tcs/xacml-spec/commits/main/xacml-v4.0-csd01.md).

| Revision | Date | Editor | Changes Made |
| :--- | :--- | :--- | :--- |
| specname-v1.0-wd01 | 2024-08-09 | Steven Legg | Initial working draft |
| | 2024-09-09 | Steven Legg | Changed **_targets_** to a single child expression. |
| | | | Removed the `<AnyOf>`, `<AllOf>` and `<Match>` elements. |
| | | | Removed **_targets_** from rules. |
| | | | Removed the only-one-applicable **_combining algorithm_**. |
| | 2024-09-28 | Cyril Dangerville | Embedded diagrams. |
| | 2024-09-30 | Cyril Dangerville | Added support for definition lists. |
| | 2024-10-22 | Steven Legg | Reformatted indented paragraphs. |
| | | | Made MustBePresent, CombinedDecision and ReturnPolicyIdList XML attributes default false. |
| | 2025-04-16 | Steven Legg | Restructured the type hierarchy for policy references. |
| | 2025-04-17 | Steven Legg | Merged **_obligations_** and **_advice_** into **_notices_**. |
| | 2025-07-15 | Steven Legg | Added support for **_short identifiers_**. |
| | 2025-07-23 | Steven Legg | Added example two showing **_short identifiers_**. |
| | 2025-07-25 | Steven Legg | Grouping **_short identifiers_** in sets rather than collections. |
| | | | Replaced ShortIdentifier with ShortId. |
| | | | Replaced SIDCollection with ShortIdSet. |

-------

<!-- The following centered line represents the end of the document -->  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
