<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8179.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8179: Indien OntvangerRol = 3 (= Zorgverzekeraar), = 4 (= DJI) of = 5 (= Zorgkantoor), dan moet DoorsturenToegestaan = Ja. -->
	<xsl:template name="rc8179">
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="DoorsturenToegestaan"/>
		
		<xsl:if test="($OntvangerRol='3' or $OntvangerRol='4' or $OntvangerRol='5') and not($DoorsturenToegestaan='true')">
			<gds802:Feedback>
				<gds802:Retourcode>8179</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($DoorsturenToegestaan)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$DoorsturenToegestaan"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
