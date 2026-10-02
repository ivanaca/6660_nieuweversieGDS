<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9447.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9447: Indien ZorgaanbiederSpecificatie voorkomt, dan mag Zorgaanbiedercode of BeroepZorgverlener niet voorkomen. 
	IF EXIST ZorgaanbiederSpecificatie, THEN NOT EXIST  Zorgaanbiedercode OR BeroepZorgverlener -->
	<xsl:template name="rc9447">
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="BeroepZorgverlener"/>
		
		<xsl:if test="$ZorgaanbiederSpecificatie and ($Zorgaanbiedercode or $BeroepZorgverlener)">
			<gds802:Feedback>
				<gds802:Retourcode>9447</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$Zorgaanbiedercode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
				<xsl:if test="$BeroepZorgverlener">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($BeroepZorgverlener)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$BeroepZorgverlener"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>	
				</xsl:if>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
