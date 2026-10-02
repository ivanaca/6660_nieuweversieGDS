<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9425.xslt, v2 13 januari 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9425: Indien Berichtcode = 573, dan moet waarde PrestatieCodelijstCode = 071 (= NZa Codelijst ZPM) of 999 (Prestaties zonder landelijke code) zijn. -->
	<xsl:template name="rc9425">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="PrestatieCodelijstCode"/>
		
		<xsl:if test="$Berichtcode=573 and not($PrestatieCodelijstCode='071' or $PrestatieCodelijstCode='999')">
			<gds802:Feedback>
				<gds802:Retourcode>9425</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Berichtcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Berichtcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$PrestatieCodelijstCode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>	
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
