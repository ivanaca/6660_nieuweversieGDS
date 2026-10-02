<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9419.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9419: Indien OntvangerRol = 3 (= Zorgverzekeraar) of 5 (= Zorgkantoor), dan mag Plaatsingsbesluit niet voorkomen. -->
	<xsl:template name="rc9419">
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="Plaatsingsbesluit"/>
		<xsl:param name="PlaatsingsbesluitNummer"/>
		
		<xsl:if test="($OntvangerRol='3' or $OntvangerRol='5') and $Plaatsingsbesluit">
			<gds802:Feedback>
				<gds802:Retourcode>9419</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PlaatsingsbesluitNummer)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PlaatsingsbesluitNummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
