<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9448.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9448: Indien ZorgaanbiederSpecificatie voorkomt, dan mag Zorgaanbiedercode niet voorkomen. -->
	<xsl:template name="rc9448">
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		<xsl:param name="Zorgaanbiedercode"/>
		
		<xsl:if test="$ZorgaanbiederSpecificatie and $Zorgaanbiedercode">
			<gds802:Feedback>
				<gds802:Retourcode>9448</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
