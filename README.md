# README

Members of the <a href="https://www.oasis-open.org/committees/xacml/">OASIS eXtensible Access Control Markup Language (XACML)</a> create and manage technical content in this TC GitHub repository ( <a href="https://github.com/oasis-tcs/xacml-spec">https://github.com/oasis-tcs/xacml-spec</a> ) as part of the TC's chartered work (the program of work and deliverables described in its <a href="https://www.oasis-open.org/committees/xacml/charter.php">charter</a>).

OASIS TC GitHub repositories, as described in <a href="https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work">GitHub Repositories for OASIS TC Members' Chartered Work</a>, are governed by the OASIS <a href="https://www.oasis-open.org/policies-guidelines/tc-process">TC Process</a>, <a href="https://www.oasis-open.org/policies-guidelines/ipr">IPR Policy</a>, and other policies, similar to TC Wikis, TC issues tracking instances, etc.  While they make use of public GitHub repositories, these TC GitHub repositories are distinct from <a href="https://www.oasis-open.org/resources/open-repositories">OASIS Open Repositories</a>, which are used for development of open source <a href="https://www.oasis-open.org/resources/open-repositories/licenses">licensed</a> content.

## Description

The purpose of the XACML TC is to define a core XML schema for representing authorization and entitlement policies. This GitHub repository lists ]tracking issues and features for the OASIS XACML TC. Requests for modification can be made via <a href="https://github.com/oasis-tcs/xacml-spec/issues">Github Issues</a>.

## Contributions
As stated in this repository's <a href="https://github.com/oasis-tcs/xacml-spec/blob/master/CONTRIBUTING.md">CONTRIBUTING file</a>, contributors to this repository are expected to be Members of the OASIS XACML TC, for any substantive change requests. Anyone wishing to contribute to this GitHub project and <a href="https://www.oasis-open.org/join/participation-instructions">participate</a> in the TC's technical activity is invited to join as an OASIS TC Member.  Public feedback is also accepted, subject to the terms of the <a href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>, as noted in the <a href="https://github.com/oasis-tcs/xacml-spec/blob/master/LICENSE.md">LICENSE</a> file.  

## Licensing
Please see the <a href="https://github.com/oasis-tcs/xacml-spec/blob/master/LICENSE.md">LICENSE</a> file for description of the license terms and OASIS policies applicable to the TC's work in this GitHub project. Content in this repository is intended to be part of the XACML TC's permanent record of activity, visible and freely available for all to use, subject to applicable OASIS policies, as presented in the repository <a href="https://github.com/oasis-tcs/xacml-spec/blob/master/LICENSE.md">LICENSE</a> file.

## Further Description of this Repository

Please note that the TC currently is soliciting comments from the community on evolution and potential reworking of core elements of the XACML specification.  See this repository's <a href="https://github.com/oasis-tcs/xacml-spec/blob/master/CONTRIBUTING.md">CONTRIBUTING file</a>for more. 

## Contact
Please send questions or comments about <a href="https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work">OASIS TC GitHub repositories</a> to <a href="mailto:project-administration@oasis-open.org">Project Administration</a>.  For questions about content in this repository, please contact the TC Chair or Co-Chairs as listed on the the XACML TC's <a href="https://www.oasis-open.org/committees/xacml/">home page</a>.

## FAQ (Frequently Asked Questions)

*All the Java commands below have been tested with Java 21 LTS.*

### How do I validate XACML documents with the XACML schemas (when I support XML Schema 1.1)?

Since XACML 4.0, XACML schemas exist in [XSD version 1.1](https://www.w3.org/TR/xmlschema11-1/) to provide more advanced validation and especially an equivalence for the UML constraints (OCL) defined in ACAL agnostic model, in form of XSD 1.1 assertions (`xs:assert`). One way to validate against a XSD 1.1 schema is to use [Apache Xerces2 Java XML Parser](https://xerces.apache.org/xerces2-j/), more specifically its [binary distribution](https://xerces.apache.org/mirrors.cgi#binary) called _**Xerces2 Java 2.12.2 (XML Schema 1.1)**_. 

Download the binary distribution zip or tar.gz depending on your OS, then unzip it to a folder, say `xerces-2_12_2-xml-schema-1.1`.

Then (based on Apache [Xerces2 Java XML Parser's issue 1726](https://issues.apache.org/jira/browse/XERCESJ-1726?page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel&focusedCommentId=17191197)), change your working directory to the root of this repository where the XACML schemas are located.

In order to validate a XACML document, say `MyPolicy.xml`, run the following command line (you may omit `-a ./xacml-xpath-v4.0-schema.xsd` (resp. `a ./xacml-jsonpath-v4.0-schema.xsd`) if your XACML document does not use the XPath (resp. JSONPath) Profile):

```console
$ java -cp "xerces-2_12_2-xml-schema-1.1/*" jaxp.SourceValidator -i MyPolicy.xml -a ./xacml-core-v4.0-schema.xsd -a ./xacml-xpath-v4.0-schema.xsd -a ./xacml-jsonpath-v4.0-schema.xsd -f -fx -xsd11
```

### If I do not support the XML Schema 1.1, how do I validate XACML documents with the XACML schemas (using only Xml Schema 1.0 and Schematron)?

As an alternative to the XSD 1.1 core schema (with XSD 1.1 assertions) previously mentioned, implementers that only support XSD 1.0 may use an XSD 1.0 version of the core schema - obtained by filtering out all the schema elements with attribute `vc:minVersion="1.1"` according to the [XML Schema Versioning standard](https://www.w3.org/2007/XMLSchema-versioning/) (e.g. using a [XSLT](https://www.w3.org/TR/xslt20/) stylesheet) - in combination with the core [Schematron](https://www.iso.org/standard/85625.html) [schema](xacml-core-v4.0-schematron.sch), which provides an equivalent for XSD 1.1 assertions.

Here is an example of how to do that with the **XML schema 1.0-only version of Xerces2 Java 2.12.3** (instead of the *XML Schema 1.1* one) for the XML schema 1.0 validation and **[Schxslt2](https://codeberg.org/SchXslt/schxslt2/)** for the Schematron validation.

1. Download and unzip the XML schema 1.0 version of Xerces2, then download Schxslt2's XSLT stylesheet:
   ```console
   $ wget https://dlcdn.apache.org//xerces/j/binaries/Xerces-J-bin.2.12.2.tar.gz -P /tmp
   $ pushd tmp; tar xvzf Xerces-J-bin.2.12.2.tar.gz; popd
   $ wget https://codeberg.org/SchXslt/schxslt2/raw/branch/main/src/main/resources/content/transpile.xsl -P /tmp
   ```

2. Generate (once and for all validations) the XSD 1.0 version of the core schema using the XSLT stylesheet `xsd1.1-to-1.0.xslt` with [Saxon HE](https://www.saxonica.com/html/download/java.html) (tested with v12.5) as the XSLT engine:
   ```console
   $ java -jar saxon-he-12.5.jar -xsl:xsd1.1-to-1.0.xsl -s:xacml-core-v4.0-schema.xsd -o:/tmp/xacml-core-v4.0-schema-1.0.xsd
   ```

3. Generate (once and for all validations) - from the Schematron schema - the XSLT stylesheet that will be processed by the XSLT engine to do the actual Schematron validation of XML documents. Here is an example of generation with [Schxslt2](https://codeberg.org/SchXslt/schxslt2/):

    ```console
    $ java -jar saxon-he-12.5.jar -xsl:/tmp/transpile.xsl -s:xacml-core-v4.0-schematron.sch -o:/tmp/xacml-core-v4.0-schematron.xsl
    ```

4. In order to validate a XACML document, say `MyPolicy.xml`, against both the XSD 1.0 and Schematron schemas, run the following command lines:

    ```console
    $ java -cp "/tmp/xerces-2_12_2/*" jaxp.SourceValidator -a /tmp/xacml-core-v4.0-schema-1.0.xsd -a xacml-xpath-v4.0-schema.xsd -a xacml-jsonpath-v4.0-schema.xsd -f -i MyPolicy.xml
    $ java -jar saxon-he-12.5.jar -xsl:/tmp/xacml-core-v4.0-schematron.xsl MyPolicy.xml
    ```

    This last command will output a [Schematron Validation Report (SVRL)](https://schematron.com/document/3427.html).
