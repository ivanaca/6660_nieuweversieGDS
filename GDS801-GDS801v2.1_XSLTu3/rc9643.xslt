<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9643.xslt, 20 oktober 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- Retourcode 9643: Bij prestaties met gelijk prestatieKoppelnummer mag de combinatie van Informatiecode = 2 (= Specificatie) en InformatieCode = 3 (= Informatie) niet voorkomen.   -->
	<xsl:template name="rc9643">
		<xsl:param name="PrestatieKoppelnummer"/>
		<xsl:param name="InformatieCode"/>
		
		
		<xsl:if test="//gds801:DebetPrestatie[gds801:PrestatieKoppelnummer=$PrestatieKoppelnummer]/gds801:InformatieCode[contains(text(),'02')] and //gds801:DebetPrestatie[gds801:PrestatieKoppelnummer=$PrestatieKoppelnummer]/gds801:InformatieCode[contains(text(),'03')]">
			<gds802:Feedback>
				<gds802:Retourcode>9643</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>PrestatieKoppelnummer</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieKoppelnummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>InformatieCode</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="//gds801:DebetPrestatie[gds801:PrestatieKoppelnummer=$PrestatieKoppelnummer]/gds801:InformatieCode[contains(text(),'02')]"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>InformatieCode</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="//gds801:DebetPrestatie[gds801:PrestatieKoppelnummer=$PrestatieKoppelnummer]/gds801:InformatieCode[contains(text(),'03')]"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
		
	</xsl:template>
</xsl:stylesheet>
