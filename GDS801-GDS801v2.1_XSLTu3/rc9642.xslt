<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9642.xslt, 20 oktober 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- Retourcode 9642: Indien Informatiecode = 2 (= Specificatie) of 3 (=Informatie), dan moet bij een prestatie met gelijk PrestatieKoppelnummer InformatieCode = 1 (= Declaratie) voorkomen.  -->
	<xsl:template name="rc9642">
		<xsl:param name="PrestatieKoppelnummer"/>
		<xsl:param name="InformatieCode"/>
		
		
		<xsl:if test="not(//gds801:DebetPrestatie[gds801:PrestatieKoppelnummer=$PrestatieKoppelnummer]/gds801:InformatieCode[contains(text(),'01')])">
			<gds802:Feedback>
				<gds802:Retourcode>9642</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>PrestatieKoppelnummer</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieKoppelnummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>InformatieCode</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$InformatieCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
		
	</xsl:template>
</xsl:stylesheet>
