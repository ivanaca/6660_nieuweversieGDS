<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9449.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9449: Indien PrestatieCodelijstCode = 071, en ZorgaanbiederSpecificatie of BeroepZorgverlener voorkomt, dan moet NaamZorgverlener voorkomen.
	IF PrestatieCodelijstCode = 071 AND EXIST ZorgaanbiederSpecificatie OR BeroepZorgverlener THEN EXIST NaamZorgverlener -->
	<xsl:template name="rc9449">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		<xsl:param name="BeroepZorgverlener"/>
		<xsl:param name="NaamZorgverlener"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and ($ZorgaanbiederSpecificatie or $BeroepZorgverlener) and not($NaamZorgverlener)">
			<gds802:Feedback>
				<gds802:Retourcode>9449</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$ZorgaanbiederSpecificatie">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
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
