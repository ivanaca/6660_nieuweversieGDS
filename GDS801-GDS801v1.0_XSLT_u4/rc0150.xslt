<?xml version="1.0" encoding="UTF-8"?>
<!-- rc0150.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 0150: De waarde van TotaalDeclaratieBedragInclBtw, rekening houdend met debet/credit, moet gelijk zijn aan de som van de waarden van DeclaratiebedragInclBtw, rekening houdend met DebetCredit, van alle Prestaties.   -->
	<xsl:template name="rc0150">
		<xsl:param name="TotaalDeclaratiebedragInclBtw"/>
		<xsl:param name="TotaalDeclaratiebedragDCIndicator"/>
		<xsl:param name="TotaalDebetPrestaties"/>
		<xsl:param name="TotaalCreditPrestaties"/>

		<xsl:variable name="Totaalbedrag">
		<xsl:choose>
			<xsl:when test="$TotaalDeclaratiebedragDCIndicator='D'">
				<xsl:value-of select="$TotaalDeclaratiebedragInclBtw"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$TotaalDeclaratiebedragInclBtw * -1"/>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		
		<xsl:if test="not(format-number($Totaalbedrag, '#.00') = format-number((format-number($TotaalDebetPrestaties, '#.00') - format-number($TotaalCreditPrestaties, '#.00')), '#.00'))">
			<gds802:Feedback>
				<gds802:Retourcode>0150</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TotaalDeclaratiebedragInclBtw)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TotaalDeclaratiebedragInclBtw"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TotaalDeclaratiebedragDCIndicator)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TotaalDeclaratiebedragDCIndicator"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
