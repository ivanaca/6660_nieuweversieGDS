<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9474.xslt, 10 dec 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9474: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger niet = 9992 (=DJI) en DiagnoseCodelijstCode voorkomt, dan mag alleen DiagnoseCodelijstCode 029 (= DSM hoofdgroep GGZ), 031 (= Zorgvraagtype GGZ) of 033 (= GB-ggz Profiel) voorkomen. -->
	<xsl:template name="rc9474">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and not($Ontvanger='9992') and ($DiagnoseCodelijstCode != '')">
			<xsl:if test="not($DiagnoseCodelijstCode='029' or $DiagnoseCodelijstCode='031' or $DiagnoseCodelijstCode='033')">
				<gds802:Feedback>
					<gds802:Retourcode>9474</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
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
