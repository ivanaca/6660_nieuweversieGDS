<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9263b.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9263b: Indien Berichtcode = 574 (= Retourbericht Declaratie), dan mag alleen OntvangerRol = 1 (= Zorgaanbieder) of 2 (= Servicebureau) voorkomen. -->
	<xsl:template name="rc9263b">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="OntvangerRol"/>

		<xsl:if test="$Berichtcode=574 and not($OntvangerRol='1' or $OntvangerRol='2')">
			<gds802:Feedback>
				<gds802:Retourcode>9263</gds802:Retourcode>
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
