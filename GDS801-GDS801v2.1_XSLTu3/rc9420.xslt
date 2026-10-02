<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9420.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9420: Indien BSN voorkomt, dan mag Verzekerdennummer niet voorkomen. -->
	<xsl:template name="rc9420">
		<xsl:param name="BSN"/>
		<xsl:param name="Verzekerdennummer"/>

		<xsl:if test="$BSN and $Verzekerdennummer">
			<gds802:Feedback>
				<gds802:Retourcode>9420</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BSN)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BSN"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Verzekerdennummer)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Verzekerdennummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
