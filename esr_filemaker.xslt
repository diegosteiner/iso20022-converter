<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:camt="urn:iso:std:iso:20022:tech:xsd:camt.054.001.04" exclude-result-prefixes="camt">

  <xsl:template match="/">
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
      <DATABASE DATEFORMAT="yyyy-mm-dd" NAME="camt.054-ESR-ASR" />
      <METADATA>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A03 Ref.Nr." TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Art" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Waehrung" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A04 Betrag" TYPE="NUMBER"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A07 Verarbdatum" TYPE="DATE"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A08 Gutschriftdatum" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A10 Rejectcode" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A11 Taxen" TYPE="NUMBER"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="A12 Debitor" TYPE="TEXT"/>
      </METADATA>
      <RESULTSET>
        <xsl:for-each select="camt:Document/camt:BkToCstmrDbtCdtNtfctn/camt:Ntfctn/camt:Ntry">
          <xsl:for-each select="camt:NtryDtls/camt:TxDtls">
            <ROW>
              <COL name="A03 Ref.Nr.">
                <DATA><xsl:value-of select="normalize-space(camt:RmtInf/camt:Strd/camt:CdtrRefInf/camt:Ref)"/></DATA>
              </COL>
              <COL name="Art">
                <DATA><xsl:value-of select="normalize-space(camt:CdtDbtInd)"/></DATA>
              </COL>
              <COL name="Waehrung">
                <DATA><xsl:value-of select="normalize-space(camt:Amt/@Ccy)"/></DATA>
              </COL>
              <COL name="A04 Betrag">
                <DATA><xsl:value-of select="normalize-space(camt:Amt)"/></DATA>
              </COL>
              <COL name="A07 Verarbdatum">
                <DATA><xsl:value-of select="normalize-space(../../camt:BookgDt/camt:Dt)"/></DATA>
              </COL>
              <COL name="A08 Gutschriftdatum">
                <DATA><xsl:value-of select="normalize-space(../../camt:ValDt/camt:Dt)"/></DATA>
              </COL>
              <COL name="A10 Rejectcode">
                <DATA><xsl:value-of select="normalize-space(camt:RmtInf/camt:Strd/camt:AddtlRmtInf)"/></DATA>
              </COL>
              <COL name="A11 Taxen">
                <DATA><xsl:value-of select="normalize-space(camt:Chrgs/camt:Rcrd/camt:Amt)"/></DATA>
              </COL>
              <COL name="A12 Debitor">
                <DATA><xsl:value-of select="normalize-space(camt:RltdPties/camt:Dbtr/camt:Nm)"/></DATA>
              </COL>
            </ROW>
          </xsl:for-each>
        </xsl:for-each>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
</xsl:stylesheet>
