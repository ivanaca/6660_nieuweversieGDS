<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9474.xslt, 10 dec 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9475: Indien PrestatieCodelijstCode = 071 ((= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en DiagnoseCodelijstCode voorkomt, dan moet de waarde van DiagnoseCodelijstCode binnen de prestatie uniek zijn. -->
	<xsl:template name="rc9475">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071'">
			<xsl:if test="count(../gds801:Diagnose[gds801:DiagnoseCodelijstCode=$DiagnoseCodelijstCode])>1">
				<gds802:Feedback>
					<gds802:Retourcode>9475</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($DiagnoseCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$DiagnoseCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>	
	</xsl:template>
</xsl:stylesheet>
