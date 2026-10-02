<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9274.xslt, sept 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9274: Indien OntvangerRol niet = 2 (= Servicebureau) en Ontvanger niet = 3356 (= SOV) of = 9989 (= OVV), dan mag AanvullendeVerzekerdegegevens niet voorkomen. -->
	<xsl:template name="rc9274">
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="AanvullendeVerzekerdegegevens"/>
		
		<xsl:if test="not($OntvangerRol='2') and not($Ontvanger=3356 or $Ontvanger=9989) and $AanvullendeVerzekerdegegevens">
			<gds802:Feedback>
				<gds802:Retourcode>9274</gds802:Retourcode>
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
