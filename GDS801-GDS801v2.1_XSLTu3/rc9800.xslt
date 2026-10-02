<?xml version="1.0" encoding="UTF-8"?>
<!-- rcxxxx.xslt, v2.0 aug 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC174: Indien Declarant/ZorgaanbiederSoort = 3 (= Zorgverlener) en Zorgaanbieder niet voorkomt,
		 dan mag Declarant/Zorgaanbiedercode niet beginnen met 01, 02, 03, 04, 05, 07, 08, 11. 12, 13, 14, 24, 26, 33, 44, 57, 84, 87, 88, 89, 90, 91, 93, 94 en 96. -->
	<xsl:template name="rc9800">
		<xsl:param name="DeclarantZorgaanbiedercode"/>
		<xsl:param name="DeclarantZorgaanbiedersoort"/>
		<xsl:param name="Zorgaanbieder"/>
		<xsl:variable name="NietToegestaneWaarden" select="'01|02|03|04|05|07|08|11|12|13|14|24|26|33|44|57|84|87|88|89|90|91|93|94|96'"/>
		<xsl:variable name="ZorgaanbiederscodeEerste2" select="substring($DeclarantZorgaanbiedercode,1,2)"/>
		<xsl:if test="$DeclarantZorgaanbiedersoort = '3' 
                and not($Zorgaanbieder) 
                and contains(concat('|', $NietToegestaneWaarden, '|'), concat('|', $ZorgaanbiederscodeEerste2, '|'))">
			<gds802:Feedback>
				<gds802:Retourcode>9800</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($DeclarantZorgaanbiedersoort)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$DeclarantZorgaanbiedersoort"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($DeclarantZorgaanbiedercode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$DeclarantZorgaanbiedercode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>