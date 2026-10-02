<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9263a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9263: Indien Berichtcode = 573 (= Declaratie),dan mag alleen OntvangerRol = 2 (= Servicebureau), 3 (= Zorgverzekeraar), 4 (= DJI) of 5 (= Zorgkantoor) voorkomen. -->
	<xsl:template name="rc9263a">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="OntvangerRol"/>

		<xsl:if test="$Berichtcode=573 and not($OntvangerRol='2' or $OntvangerRol='3' or $OntvangerRol='4' or $OntvangerRol='5')">
			<gds802:Feedback>
				<gds802:Retourcode>9263</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Berichtcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Berichtcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
