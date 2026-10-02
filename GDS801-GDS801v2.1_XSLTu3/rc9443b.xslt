<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9443b.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9443: Indien Zorgaanbiedercode niet voorkomt, dan mag ZorgaanbiederSoort niet voorkomen. -->
	<xsl:template name="rc9443b">
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSoort"/>
		
		<xsl:if test="not($Zorgaanbiedercode) and $ZorgaanbiederSoort">
			<gds802:Feedback>
				<gds802:Retourcode>9443</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSoort)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSoort"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>						
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
