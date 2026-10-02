<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9478.xslt, juli 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC104: IF PrestatieCodelijstCode = 071 AND Zorgaanbieder/ZorgaanbiederRol = 01, AND EXIST Zorgaanbieder/Zorgaanbiedercode, THEN Zorgaanbieder/ZorgaanbiederSoort = 1|3 | retourcode 9478: Zorgaanbieder/Zorgaanbiedersoort moet waarde 1 of 3 hebben. -->
	<xsl:template name="rc9478">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgaanbiederRol"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSoort"/>
		<xsl:if test="($PrestatieCodelijstCode = '071' or $PrestatieCodelijstCode = '083') and $ZorgaanbiederRol='01' and $Zorgaanbiedercode">
			<xsl:if test="$ZorgaanbiederSoort != '1' and $ZorgaanbiederSoort != '3'">
				<gds802:Feedback>
					<gds802:Retourcode>9478</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$PrestatieCodelijstCode"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($ZorgaanbiederRol)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$ZorgaanbiederRol"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($Zorgaanbiedercode)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$Zorgaanbiedercode"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($ZorgaanbiederSoort)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$ZorgaanbiederSoort"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>