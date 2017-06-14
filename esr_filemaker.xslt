<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:camt="urn:iso:std:iso:20022:tech:xsd:camt.054.001.04" exclude-result-prefixes="camt">

  <xsl:template match="/">
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
      <DATABASE DATEFORMAT="yyyy-mm-dd" NAME="camt.054-ESR-ASR" />
      <METADATA>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Teilnehmernummer" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Referenznummer" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Transaktionsart" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Transaktionswaehrung" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Transaktionsbetrag" TYPE="NUMBER"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Verarbeitungsdatum" TYPE="DATE"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Gutschriftdatum" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Rejectcode" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Taxen" TYPE="NUMBER"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Name Debitor" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Buchungswaehrung" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Buchungbetrag" TYPE="NUMBER"/>
      </METADATA>
      <RESULTSET>
        <xsl:for-each select="camt:Document/camt:BkToCstmrDbtCdtNtfctn/camt:Ntfctn/camt:Ntry">
          <xsl:for-each select="camt:NtryDtls/camt:TxDtls">
            <ROW>
              <COL name="Teilnehmernummer">
                <DATA><xsl:value-of select="normalize-space(../../camt:NtryRef)"/></DATA>
              </COL>
              <COL name="Referenznummer">
                <DATA><xsl:value-of select="normalize-space(camt:RmtInf/camt:Strd/camt:CdtrRefInf/camt:Ref)"/></DATA>
              </COL>
              <COL name="Transaktionsart">
                <DATA><xsl:value-of select="normalize-space(camt:CdtDbtInd)"/></DATA>
              </COL>
              <COL name="Transaktionswaehrung">
                <DATA><xsl:value-of select="normalize-space(camt:Amt/@Ccy)"/></DATA>
              </COL>
              <COL name="Transaktionsbetrag">
                <DATA><xsl:value-of select="normalize-space(camt:Amt)"/></DATA>
              </COL>
              <COL name="Verarbeitungsdatum">
                <DATA><xsl:value-of select="normalize-space(../../camt:BookgDt/camt:Dt)"/></DATA>
              </COL>
              <COL name="Gutschriftdatum">
                <DATA><xsl:value-of select="normalize-space(../../camt:ValDt/camt:Dt)"/></DATA>
              </COL>
              <COL name="Rejectcode">
                <DATA><xsl:value-of select="normalize-space(camt:RmtInf/camt:Strd/camt:AddtlRmtInf)"/></DATA>
              </COL>
              <COL name="Taxen">
                <DATA><xsl:value-of select="normalize-space(camt:Chrgs/camt:Rcrd/camt:Amt)"/></DATA>
              </COL>
              <COL name="Name Debitor">
                <DATA><xsl:value-of select="normalize-space(camt:RltdPties/camt:Dbtr/camt:Nm)"/></DATA>
              </COL>
              <COL name="Buchungswaehrung">
                <DATA><xsl:value-of select="normalize-space(../../camt:Amt/@Ccy)"/></DATA>
              </COL>
              <COL name="Buchtungsbetrag">
                <DATA><xsl:value-of select="normalize-space(../../camt:Amt)"/></DATA>
              </COL>
            </ROW>
          </xsl:for-each>
        </xsl:for-each>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
</xsl:stylesheet>
