<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9269.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9269: Indien OntvangerRol niet = 2 (= Servicebureau), dan moet de waarde van UzoviNummer gelijk zijn aan de waarde van Ontvanger. -->
	<xsl:template name="rc9269">
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="UzoviNummer"/>

		<xsl:if test="not($OntvangerRol='2') and not($Ontvanger=$UzoviNummer)">
			<gds802:Feedback>
				<gds802:Retourcode>9269</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($UzoviNummer)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$UzoviNummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
