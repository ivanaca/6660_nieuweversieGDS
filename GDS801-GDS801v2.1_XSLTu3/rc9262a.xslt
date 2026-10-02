<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9262a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9262: Indien Berichtcode = 573 (= Declaratie), dan mag alleen VerzenderRol = 1 (= Zorgaanbieder) of 2 (= Servicebureau) voorkomen. -->
	<xsl:template name="rc9262a">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="VerzenderRol"/>
		
		<xsl:if test="$Berichtcode=573 and not($VerzenderRol='1' or $VerzenderRol='2')">
			<gds802:Feedback>
				<gds802:Retourcode>9262</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
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
