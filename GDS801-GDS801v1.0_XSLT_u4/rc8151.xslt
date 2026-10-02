<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8151.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8151: Indien Ontvanger niet = 9992 (=  DJI/FZ), dan moet Geboortedatum voorkomen. -->
	<xsl:template name="rc8151">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Geboortedatum"/>
		
		<xsl:if test="not($Ontvanger=9992) and not($Geboortedatum)">
			<gds802:Feedback>
				<gds802:Retourcode>8151</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
