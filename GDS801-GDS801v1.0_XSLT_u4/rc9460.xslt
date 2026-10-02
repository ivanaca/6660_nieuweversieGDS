<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9460.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9460: Indien de waarde van ToegekendCreditBedragInclBtwNietFinancieel groter is dan ‘0.00’, dan moet de waarde van ToegekendCreditBedragInclBtwFinancieel gelijk zijn aan ‘0.00’. -->
	<xsl:template name="rc9460">
		<xsl:param name="ToegekendCreditBedragInclBtwNietFinancieel"/>
		<xsl:param name="ToegekendCreditBedragInclBtwFinancieel"/>

		<xsl:if test="$ToegekendCreditBedragInclBtwNietFinancieel &gt; 0 and not($ToegekendCreditBedragInclBtwFinancieel=0)">
			<gds802:Feedback>
				<gds802:Retourcode>9460</gds802:Retourcode>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ToegekendCreditBedragInclBtwNietFinancieel)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ToegekendCreditBedragInclBtwNietFinancieel"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ToegekendCreditBedragInclBtwFinancieel)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ToegekendCreditBedragInclBtwFinancieel"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
