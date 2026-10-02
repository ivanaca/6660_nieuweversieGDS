<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9453.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9453: Indien PrestatieCodelijstCode niet = 071 (= NZa Codelijst ZPM), dan mag BeroepZorgverlener niet voorkomen. -->
	<xsl:template name="rc9453">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="BeroepZorgverlener"/>
		
		<xsl:if test="not($PrestatieCodelijstCode='071') and $BeroepZorgverlener">
			<gds802:Feedback>
				<gds802:Retourcode>9453</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BeroepZorgverlener)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BeroepZorgverlener"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
