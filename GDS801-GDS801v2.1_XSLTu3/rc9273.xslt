<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9273.xslt, sept 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9273: Indien OntvangerRol = 2 (= Servicebureau) of Ontvanger = 3356 (= SOV) of = 9989 (= OVV), dan moet Aanvullende-Verzekerdegegevens voorkomen. -->
	<xsl:template name="rc9273">
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="AanvullendeVerzekerdegegevens"/>
		
		<xsl:if test="($OntvangerRol='2' or $Ontvanger=3356 or $Ontvanger=9989) and not($AanvullendeVerzekerdegegevens)">
			<gds802:Feedback>
				<gds802:Retourcode>9273</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
