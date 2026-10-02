<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9279.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9279: Indien DebetPrestatie/Eindtijd voorkomt en DebetPrestatie/Einddatum niet voorkomt, dan moet de waarde van DebetPrestatie/Begintijd kleiner zijn dan de waarde van DebetPrestatie Eindtijd. -->
	<xsl:template name="rc9279">
		<xsl:param name="Einddatum"/>
		<xsl:param name="Begintijd"/>
		<xsl:param name="Eindtijd"/>
		
		<xsl:variable name="BeginTijd" select="substring($Begintijd,1,8)"/>
		<xsl:variable name="EindTijd" select="substring($Eindtijd,1,8)"/>
		<xsl:variable name="BeginTimezoneTeken" select="substring($Begintijd,9,1)"/>
		<xsl:variable name="EindTimezoneTeken" select="substring($Eindtijd,9,1)"/>		
		<xsl:variable name="BeginTimezone" select="substring($Begintijd,10,5)"/>
		<xsl:variable name="EindTimezone" select="substring($Eindtijd,10,5)"/>			
		
		<xsl:if test="not($Einddatum) and $Eindtijd">
			<xsl:if test="not(translate($BeginTijd,':','') &lt; translate($EindTijd,':','')) or not($BeginTimezoneTeken = $EindTimezoneTeken) or not(translate($BeginTimezone,':','') = translate($EindTimezone,':',''))">
				<gds802:Feedback>
					<gds802:Retourcode>9279</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Begintijd)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Begintijd"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Eindtijd)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Eindtijd"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>	
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
