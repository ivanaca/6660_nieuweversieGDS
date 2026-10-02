<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9473.xslt, 10 dec 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9473: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger = 9992 (= DJI) en DiagnoseCodelijstCode voorkomt, dan mag alleen DiagnoseCodelijstCode 030 (= DSM hoofdgroep FZ) of 032 (= Zorgvraagtype FZ) voorkomen. -->
	<xsl:template name="rc9473">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and $Ontvanger='9992' and ($DiagnoseCodelijstCode != '')">
			<xsl:if test="not($DiagnoseCodelijstCode='030' or $DiagnoseCodelijstCode='032')">
				<gds802:Feedback>
					<gds802:Retourcode>9473</gds802:Retourcode>
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
