<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9459.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9459: Indien de waarde van ToegekendBedragInclBtwNietFinancieel groter is dan ‘0.00’, dan moet de waarde van ToegekendBedragInclBtwFinancieel gelijk zijn aan ‘0.00’. -->
	<xsl:template name="rc9459">
		<xsl:param name="ToegekendBedragInclBtwNietFinancieel"/>
		<xsl:param name="ToegekendBedragInclBtwFinancieel"/>

		<xsl:if test="$ToegekendBedragInclBtwNietFinancieel &gt; 0 and not($ToegekendBedragInclBtwFinancieel=0)">
			<gds802:Feedback>
				<gds802:Retourcode>9459</gds802:Retourcode>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ToegekendBedragInclBtwNietFinancieel)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ToegekendBedragInclBtwNietFinancieel"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ToegekendBedragInclBtwFinancieel)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ToegekendBedragInclBtwFinancieel"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
