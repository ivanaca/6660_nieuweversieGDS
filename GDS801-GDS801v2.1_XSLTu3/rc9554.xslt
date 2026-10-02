<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9554.xslt, u1 15 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9554: Indien ZorgverzekeraarsCode voorkomt, dan mag ZorgverzekeraarsNaam niet voorkomen. -->
	<xsl:template name="rc9554">
		<xsl:param name="ZorgverzekeraarsCode"/>
		<xsl:param name="ZorgverzekeraarsNaam"/>
		
		<xsl:if test="$ZorgverzekeraarsCode and $ZorgverzekeraarsNaam">
			<gds802:Feedback>
				<gds802:Retourcode>9554</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgverzekeraarsCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgverzekeraarsCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgverzekeraarsNaam)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgverzekeraarsNaam"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
