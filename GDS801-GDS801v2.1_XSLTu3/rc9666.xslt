<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9666.xslt, 17 november 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- Retourcode 9666: Indien Informatiecode = 02 (= Specificatie) of 03 (= Informatie), dan moet de waarde van BerekendBedragInclBtw gelijk zijn aan ‘0.00’en de waarde van DeclaratieBedragInclBtw gelijk zijn aan ‘0.00’.  -->
	<xsl:template name="rc9666">
		<xsl:param name="InformatieCode"/>
		<xsl:param name="BerekendBedragInclBtw"/>
		<xsl:param name="DeclaratieBedragInclBtw"/>
		
		
		<xsl:if test="not($BerekendBedragInclBtw = 0) or not($DeclaratieBedragInclBtw = 0)">
			<gds802:Feedback>
				<gds802:Retourcode>9666</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>InformatieCode</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$InformatieCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>BerekendBedragInclBtw</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BerekendBedragInclBtw"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>DeclaratieBedragInclBtw</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$DeclaratieBedragInclBtw"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
		
	</xsl:template>
</xsl:stylesheet>
