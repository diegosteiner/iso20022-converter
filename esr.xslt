<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:camt="urn:iso:std:iso:20022:tech:xsd:camt.054.001.04" exclude-result-prefixes="camt">

    <xsl:output method="text" encoding="iso-8859-1"/>

    <xsl:strip-space elements="*"/>

    <xsl:param name="delim" select="','"/>

    <xsl:param name="quote" select="'&quot;'"/>

    <xsl:param name="break" select="'&#xA;'"/>

    <xsl:template name="quoted_value">

        <xsl:param name="value"/>

        <xsl:value-of select="$quote"/>

        <xsl:value-of select="$value"/>

        <xsl:value-of select="$quote"/>

        <xsl:value-of select="$delim"/>
    </xsl:template>

    <xsl:template match="/">

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A03 Ref.Nr.</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>Art</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>Waehrung</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A04 Betrag</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A07 Verarbdatum</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A08 Gutschriftdatum</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>Debitor</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A10 Rejectcode</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="quoted_value">

            <xsl:with-param name="value">
                <xsl:text>A11 Taxen</xsl:text>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:value-of select="$break"/>

        <xsl:for-each select="camt:Document/camt:BkToCstmrDbtCdtNtfctn/camt:Ntfctn/camt:Ntry">

            <xsl:for-each select="camt:NtryDtls/camt:TxDtls">

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:RmtInf/camt:Strd/camt:CdtrRefInf/camt:Ref)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:CdtDbtInd)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:Amt/@Ccy)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:Amt)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(../../camt:BookgDt/camt:Dt)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(../../camt:ValDt/camt:Dt)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:RltdPties/camt:Dbtr/camt:Nm)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:RmtInf/camt:Strd/camt:AddtlRmtInf)"/>
                </xsl:call-template>

                <xsl:call-template name="quoted_value">
                    <xsl:with-param name="value" select="normalize-space(camt:Chrgs/camt:Rcrd/camt:Amt)"/>
                </xsl:call-template>

                <xsl:value-of select="$break"/>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
