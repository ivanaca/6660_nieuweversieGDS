<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9440.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9440: Indien Ontvanger = 7125 (Orgaan van Tijdelijk Verblijf), dan mag PrestatiecodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) niet voorkomen. -->
	<xsl:template name="rc9440">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="PrestatieCodelijstCode"/>
		
		<xsl:if test="($Ontvanger=7125) and ($PrestatieCodelijstCode='071')">
			<gds802:Feedback>
				<gds802:Retourcode>9440</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
