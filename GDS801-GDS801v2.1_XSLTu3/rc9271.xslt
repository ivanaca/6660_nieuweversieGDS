<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9271.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!--  retourcode 9271: Indien Ontvanger = 9992 (= DJI/FZ), dan mag Verzekerde/Geboortedatum niet voorkomen. -->
	<xsl:template name="rc9271">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Geboortedatum"/>
		
		<xsl:if test="$Ontvanger=9992 and $Geboortedatum">
			<gds802:Feedback>
				<gds802:Retourcode>9271</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Geboortedatum)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Geboortedatum"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
