<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9478.xslt, 17 december 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9478: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ZorgaanbiederRol = 01 (= Behandelaar) en Zorgaanbiedercode voorkomt, dan moet ZorgaanbiederSoort = 1(= Instelling) of 3 (= Zorgverlener). -->
	<xsl:template name="rc9478">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgaanbiederRol"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSoort"/>
		
		<xsl:if test="$PrestatieCodelijstCode = '071' and $ZorgaanbiederRol='01' and $Zorgaanbiedercode">
			<xsl:if test="$ZorgaanbiederSoort != '1' and $ZorgaanbiederSoort != '3'">
				<gds802:Feedback>
					<gds802:Retourcode>9478</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederRol)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederRol"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
						<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSoort)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSoort"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>						
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
