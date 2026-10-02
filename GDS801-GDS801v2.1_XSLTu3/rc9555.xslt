<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9555.xslt, u1 15 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9555: Indien Ontvanger = 7125 (= Orgaan van tijdelijk verblijf), dan moet InternationaalVerzekeringsbewijs voorkomen. -->
	<xsl:template name="rc9555">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="InternationaalVerzekeringsbewijs"/>
		
		<xsl:if test="($Ontvanger='7125') and not($InternationaalVerzekeringsbewijs)">
			<gds802:Feedback>
				<gds802:Retourcode>9555</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
