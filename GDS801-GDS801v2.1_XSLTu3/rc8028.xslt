<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8028.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- Laden Configuratiefile	-->
	<xsl:import href="config_Vecozo.xml"/>

	<!-- retourcode 8028: De waarde van BerichtSoort moet voldoen aan de omgeving van VECOZO (productie of test) -->
	<xsl:template name="rc8028">
		<xsl:param name="Berichtsoort"/>
		
		<xsl:if test="normalize-space($Berichtsoort) != normalize-space($OmgevingVecozo)">
			<gds802:Feedback>
				<gds802:Retourcode>8028</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Berichtsoort)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Berichtsoort"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>OmgevingVecozo</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OmgevingVecozo"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
