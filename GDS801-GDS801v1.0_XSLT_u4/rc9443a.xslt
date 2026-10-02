<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9443a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9443: Indien Zorgaanbiedercode voorkomt, dan moet ZorgaanbiederSoort voorkomen. -->
	<xsl:template name="rc9443a">
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSoort"/>
		
		<xsl:if test="$Zorgaanbiedercode and not($ZorgaanbiederSoort)">
			<gds802:Feedback>
				<gds802:Retourcode>9443</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>						
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
