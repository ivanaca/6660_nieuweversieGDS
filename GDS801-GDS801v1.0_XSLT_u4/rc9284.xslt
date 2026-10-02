<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9284.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9284: Indien Ontvanger = 9992 (= DJI/FZ), dan moet  Plaatsingsbesluit voorkomen. -->
	<xsl:template name="rc9284">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Plaatsingsbesluit"/>
		
		<xsl:if test="$Ontvanger='9992' and not($Plaatsingsbesluit)">
			<gds802:Feedback>
				<gds802:Retourcode>9284</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
