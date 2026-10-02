<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9280.xslt, juli 2026 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9280: Indien PrestatieCodelijstCode = 079 (=GLI) of  082 (= Revalidatie- en herstelzorg), dan moet Verwijzing voorkomen.
 -->
	<xsl:template name="rc9280">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Verwijzing"/>
		
		<xsl:if test="($PrestatieCodelijstCode='082' or $PrestatieCodelijstCode='079') and not($Verwijzing)">
			<gds802:Feedback>
				<gds802:Retourcode>9280</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
