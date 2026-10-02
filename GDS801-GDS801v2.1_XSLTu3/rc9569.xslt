<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9569.xslt, juli 2026 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9569: Indien PrestatieCodelijstCode = 079 (= GLI) en Verwijzer/Zorgaanbiederscode komt voor, dan moet Verwijzer/ZorgaanbiederSoort = 3 (= Zorgverlener) voorkomen . -->
	<xsl:template name="rc9569">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSoort"/>
				
		<xsl:if test="($PrestatieCodelijstCode='079' and $Zorgaanbiedercode and $ZorgaanbiederSoort!=3)">
			<gds802:Feedback>
				<gds802:Retourcode>9569</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$Zorgaanbiedercode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>				
				<xsl:if test="$ZorgaanbiederSoort">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSoort)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSoort"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>					
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
