<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9507.xslt, 18 maart 2022 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9507: VC112: Indien ToegekendBedragInclBtwNietFinancieel > 0.00, dan moet ToegekendBedragInclBtwFinancieel = 0.00. -->
	<xsl:template name="rc9507">
		<xsl:param name="BedragInclBtwNietFinancieel"/>
		<xsl:param name="BedragInclBtwFinancieel"/>
		
		<xsl:if test="($BedragInclBtwNietFinancieel> 0 and $BedragInclBtwFinancieel > 0)">
			<gds802:Feedback>
				<gds802:Retourcode>9507</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BedragInclBtwNietFinancieel)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BedragInclBtwNietFinancieel"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BedragInclBtwFinancieel)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BedragInclBtwFinancieel"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
