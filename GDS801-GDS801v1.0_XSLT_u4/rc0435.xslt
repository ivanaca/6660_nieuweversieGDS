<?xml version="1.0" encoding="UTF-8"?>
<!-- rc0435.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 0435: Indien Verzekerdennummer niet voorkomt en Ontvanger niet = 9992 (= DJI/FZ) of = 7125 (= Orgaan van Verblijf), dan moet BSN voorkomen. -->
	<xsl:template name="rc0435">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Verzekerdennummer"/>
		<xsl:param name="BSN"/>

		<xsl:if test="not($Verzekerdennummer) and not($Ontvanger=9992 or $Ontvanger=7125) and not($BSN)">
			<gds802:Feedback>
				<gds802:Retourcode>0435</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
