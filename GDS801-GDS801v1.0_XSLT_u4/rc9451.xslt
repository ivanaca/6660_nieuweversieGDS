<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9451.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9451: Indien BeroepZorgverlener voorkomt, dan mag Zorgaanbiedercode en ZorgaanbiederSpecificatie niet voorkomen. 
	IF EXIST BeroepZorgverlener, THEN NOT EXIST Zorgaanbiedercode AND ZorgaanbiederSpecificatie. -->
	<xsl:template name="rc9451">
		<xsl:param name="BeroepZorgverlener"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		
		<xsl:if test="$BeroepZorgverlener and ($Zorgaanbiedercode and $ZorgaanbiederSpecificatie)">
			<gds802:Feedback>
				<gds802:Retourcode>9451</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BeroepZorgverlener)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BeroepZorgverlener"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
