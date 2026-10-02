<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9416.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9416: Indien Ontvanger niet = 7125 (= Orgaan van tijdelijk verblijf), dan mag BuitenlandVerzekerde niet voorkomen -->
	<xsl:template name="rc9416">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="BuitenlandVerzekerde"/>
		
		<xsl:if test="not($Ontvanger=7125) and $BuitenlandVerzekerde">
			<gds802:Feedback>
				<gds802:Retourcode>9416</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BuitenlandVerzekerde/gds801:BuitenlandseZorgverzekeraarsCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BuitenlandVerzekerde/gds801:BuitenlandseZorgverzekeraarsCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
