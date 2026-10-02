<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8101.xslt, sept 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8101: Indien BSN niet voorkomt en Ontvanger niet = 3356 (= SOV) of = 9989 (= OVV), dan moet Verzekerdennummer voorkomen. -->
	<xsl:template name="rc8101">
		<xsl:param name="BSN"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Verzekerdennummer"/>

		<xsl:if test="not($BSN) and not($Ontvanger=3356 or $Ontvanger=9989) and not($Verzekerdennummer)">
			<gds802:Feedback>
				<gds802:Retourcode>8101</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
