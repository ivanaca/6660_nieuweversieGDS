<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9450.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9450: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ZorgaanbiederSpecificatie voorkomt, dan moet NaamZorgverlener voorkomen.
	IF PrestatieCodelijstCode = 071 AND EXIST ZorgaanbiederSpecificatie THEN EXIST NaamZorgverlener -->
	<xsl:template name="rc9450">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		<xsl:param name="NaamZorgverlener"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and $ZorgaanbiederSpecificatie and not($NaamZorgverlener)">
			<gds802:Feedback>
				<gds802:Retourcode>9450</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
