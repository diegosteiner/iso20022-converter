<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:camt2009="urn:iso:std:iso:20022:tech:xsd:camt.054.001.04"
  xmlns:camt2019="urn:iso:std:iso:20022:tech:xsd:camt.054.001.08"
  exclude-result-prefixes="camt2009 camt2019">

  <xsl:template match="/">
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
      <DATABASE DATEFORMAT="yyyy-mm-dd" NAME="camt.054-ESR-ASR" />
      <METADATA>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Teilnehmernummer" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Referenznummer" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Transaktionsart" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Transaktionswaehrung" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Transaktionsbetrag" TYPE="NUMBER" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Verarbeitungsdatum" TYPE="DATE" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Gutschriftdatum" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Rejectcode" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Taxen Transaktionwaehrung" TYPE="NUMBER" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Taxen Transaktionbetrag" TYPE="NUMBER" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Name Debitor" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Buchungswaehrung" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Buchungbetrag" TYPE="NUMBER" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Taxen Buchungwaehrung" TYPE="TEXT" />
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Taxen Buchungbetrag" TYPE="NUMBER" />
      </METADATA>
      <RESULTSET>
        <xsl:for-each
          select="camt2009:Document/camt2009:BkToCstmrDbtCdtNtfctn/camt2009:Ntfctn/camt2009:Ntry | camt2019:Document/camt2019:BkToCstmrDbtCdtNtfctn/camt2019:Ntfctn/camt2019:Ntry">
          <xsl:for-each
            select="camt2009:NtryDtls/camt2009:TxDtls | camt2019:NtryDtls/camt2019:TxDtls">
            <ROW>
              <COL name="Teilnehmernummer">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(../../camt2009:NtryRef | ../../camt2019:NtryRef)" />
                </DATA>
              </COL>
              <COL name="Referenznummer">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(camt2009:RmtInf/camt2009:Strd/camt2009:CdtrRefInf/camt2009:Ref | camt2019:RmtInf/camt2019:Strd/camt2019:CdtrRefInf/camt2019:Ref)" />
                </DATA>
              </COL>
              <COL name="Transaktionsart">
                <DATA>
                  <xsl:value-of select="normalize-space(camt2009:CdtDbtInd | camt2019:CdtDbtInd)" />
                </DATA>
              </COL>
              <COL name="Transaktionswaehrung">
                <DATA>
                  <xsl:value-of select="normalize-space(camt2009:Amt/@Ccy | camt2019:Amt/@Ccy)" />
                </DATA>
              </COL>
              <COL name="Transaktionsbetrag">
                <DATA>
                  <xsl:value-of select="normalize-space(camt2009:Amt | camt2019:Amt)" />
                </DATA>
              </COL>
              <COL name="Verarbeitungsdatum">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(../../camt2009:BookgDt/camt2009:Dt | ../../camt2019:BookgDt/camt2019:Dt)" />
                </DATA>
              </COL>
              <COL name="Gutschriftdatum">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(../../camt2009:ValDt/camt2009:Dt | ../../camt2019:ValDt/camt2019:Dt)" />
                </DATA>
              </COL>
              <COL name="Rejectcode">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(camt2009:RmtInf/camt2009:Strd/camt2009:AddtlRmtInf | camt2019:RmtInf/camt2019:Strd/camt2019:AddtlRmtInf)" />
                </DATA>
              </COL>
              <COL name="Taxen Transaktionswaehrung">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(camt2009:Chrgs/camt2009:Rcrd/camt2009:Amt/@Ccy | camt2019:Chrgs/camt2019:Rcrd/camt2019:Amt/@Ccy)" />
                </DATA>
              </COL>
              <COL name="Taxen Transaktionsbetrag">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(camt2009:Chrgs/camt2009:Rcrd/camt2009:Amt | camt2019:Chrgs/camt2019:Rcrd/camt2019:Amt)" />
                </DATA>
              </COL>
              <COL name="Name Debitor">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(camt2009:RltdPties/camt2009:Dbtr/camt2009:Nm | camt2019:RltdPties/camt2019:Dbtr/camt2019:Pty/camt2019:Nm)" />
                </DATA>
              </COL>
              <COL name="Buchungswaehrung">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(../../camt2009:Amt/@Ccy | ../../camt2019:Amt/@Ccy)" />
                </DATA>
              </COL>
              <COL name="Buchungstotal">
                <DATA>
                  <xsl:value-of select="normalize-space(../../camt2009:Amt | ../../camt2019:Amt)" />
                </DATA>
              </COL>
              <COL name="Taxen Buchungswaehrung">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(../../camt2009:Chrgs/camt2009:TtlChrgsAndTaxAmt/@Ccy | ../../camt2019:Chrgs/camt2019:TtlChrgsAndTaxAmt/@Ccy)" />
                </DATA>
              </COL>
              <COL name="Taxen Buchungsbetrag">
                <DATA>
                  <xsl:value-of
                    select="normalize-space(../../camt2009:Chrgs/camt2009:TtlChrgsAndTaxAmt | ../../camt2019:Chrgs/camt2019:TtlChrgsAndTaxAmt)" />
                </DATA>
              </COL>
            </ROW>
          </xsl:for-each>
        </xsl:for-each>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
</xsl:stylesheet>
