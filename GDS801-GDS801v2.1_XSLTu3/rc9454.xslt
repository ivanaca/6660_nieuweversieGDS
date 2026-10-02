<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9454.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9454: Indien Berichtcode = 573, dan moet Zorgaanbiedercode of ZorgaanbiederSpecificatie of BeroepZorgverlener voorkomen.
	IF Berichtcode = 573, THEN EXIST Zorgaanbiedercode OR ZorgaanbiederSpecificatie OR BeroepZorgverlener. -->
	<xsl:template name="rc9454">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		<xsl:param name="BeroepZorgverlener"/>
		
		<xsl:if test="$Berichtcode=573  and not($Zorgaanbiedercode or $ZorgaanbiederSpecificatie or $BeroepZorgverlener)">
			<gds802:Feedback>
				<gds802:Retourcode>9454</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Berichtcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Berichtcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
