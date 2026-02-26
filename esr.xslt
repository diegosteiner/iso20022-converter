<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:camt2009="urn:iso:std:iso:20022:tech:xsd:camt.054.001.04"
    xmlns:camt2019="urn:iso:std:iso:20022:tech:xsd:camt.054.001.08"
    exclude-result-prefixes="camt2009 camt2019">

    <xsl:output method="text" encoding="iso-8859-1" />

    <xsl:strip-space elements="*" />

    <xsl:param name="delim" select="','" />

    <xsl:param name="quote" select="'&quot;'" />

    <xsl:param name="break" select="'&#xA;'" />

    <xsl:template name="quoted_value">

        <xsl:param name="value" />

        <xsl:value-of select="$quote" />

        <xsl:value-of select="$value" />

        <xsl:value-of
            select="$quote" />

        <xsl:value-of select="$delim" />
    </xsl:template>

    <xsl:template match="/">

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A03 Ref.Nr.</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>Art</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>Waehrung</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A04 Betrag</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A07 Verarbdatum</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A08 Gutschriftdatum</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>Debitor</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A10 Rejectcode</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template
            name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A11 Taxen</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:value-of
            select="$break" />

        <xsl:for-each
            select="camt2009:Document/camt2009:BkToCstmrDbtCdtNtfctn/camt2009:Ntfctn/camt2009:Ntry | camt2019:Document/camt2019:BkToCstmrDbtCdtNtfctn/camt2019:Ntfctn/camt2019:Ntry">

            <xsl:for-each
                select="camt2009:NtryDtls/camt2009:TxDtls | camt2019:NtryDtls/camt2019:TxDtls">

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:RmtInf/camt2009:Strd/camt2009:CdtrRefInf/camt2009:Ref | camt2019:RmtInf/camt2019:Strd/camt2019:CdtrRefInf/camt2019:Ref)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:CdtDbtInd | camt2019:CdtDbtInd)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:Amt/@Ccy | camt2019:Amt/@Ccy)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:Amt | camt2019:Amt)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(../../camt2009:BookgDt/camt2009:Dt | ../../camt2019:BookgDt/camt2019:Dt)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(../../camt2009:ValDt/camt2009:Dt | ../../camt2019:ValDt/camt2019:Dt)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:RltdPties/camt2009:Dbtr/camt2009:Nm | camt2019:RltdPties/camt2019:Dbtr/camt2019:Pty/camt2019:Nm)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:RmtInf/camt2009:Strd/camt2009:AddtlRmtInf | camt2019:RmtInf/camt2019:Strd/camt2019:AddtlRmtInf)" />
                </xsl:call-template>

                <xsl:call-template
                    name="quoted_value">
                    <xsl:with-param name="value"
                        select="normalize-space(camt2009:Chrgs/camt2009:Rcrd/camt2009:Amt | camt2019:Chrgs/camt2019:Rcrd/camt2019:Amt)" />
                </xsl:call-template>

                <xsl:value-of
                    select="$break" />
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
