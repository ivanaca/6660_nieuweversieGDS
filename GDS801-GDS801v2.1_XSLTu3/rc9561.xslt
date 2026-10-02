<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9561.xslt, 29 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9561: Indien PrestatieCodelijstCode = 073 (= Fysiotherapie of 074 (= Oefentherapie)), dan moet AanvullendPrestatieKenmerk met ApkCodelijstCode = 004 (= Aanspraakcode) voorkomen. -->
	<xsl:template name="rc9561">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ApkCodelijstCode"/>
		<xsl:if test="($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074') and not($ApkCodelijstCode)">
			<gds802:Feedback>
				<gds802:Retourcode>9561</gds802:Retourcode>
				<!--som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
