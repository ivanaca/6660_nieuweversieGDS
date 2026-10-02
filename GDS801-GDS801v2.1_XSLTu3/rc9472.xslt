<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9472.xslt, 10 dec 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">


	<!-- retourcode 9472: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en DiagnoseCodelijstCode voorkomt, dan mag  DiagnoseCodelijstCode combinatie 029 en 033 niet voorkomen. -->
	<xsl:template name="rc9472">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		
		<xsl:if test="$PrestatieCodelijstCode = '071' and $DiagnoseCodelijstCode != ''">
			<xsl:if test="gds801:Diagnose/gds801:DiagnoseCodelijstCode[contains(text(),'029')] and gds801:Diagnose/gds801:DiagnoseCodelijstCode[contains(text(),'033')]">
				<gds802:Feedback>
					<gds802:Retourcode>9472</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>DiagnoseCodelijstCode</gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="gds801:Diagnose/gds801:DiagnoseCodelijstCode[contains(text(),'029')]"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>DiagnoseCodelijstCode</gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="gds801:Diagnose/gds801:DiagnoseCodelijstCode[contains(text(),'033')]"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
