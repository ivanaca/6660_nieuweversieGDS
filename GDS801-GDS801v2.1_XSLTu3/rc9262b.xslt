<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9262b.xslt, sept 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9262b: Indien Berichtcode = 574 (= Retourinformatie Generieke Declaratie Standaard), dan mag alleen VerzenderRol = 2 (= Servicebureau), 3 (= Zorgverzekeraar), 4 (= DJI), 5 (= Zorgkantoor) of 6 (= VECOZO) of 7 (= CAK) voorkomen. -->
	<xsl:template name="rc9262b">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="VerzenderRol"/>

		<xsl:if test="$Berichtcode=574 and not($VerzenderRol='2' or $VerzenderRol='3' or $VerzenderRol='4' or $VerzenderRol='5' or $VerzenderRol='6' or $VerzenderRol='7')">
			<gds802:Feedback>
				<gds802:Retourcode>9262</gds802:Retourcode>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Berichtcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Berichtcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($VerzenderRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$VerzenderRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
