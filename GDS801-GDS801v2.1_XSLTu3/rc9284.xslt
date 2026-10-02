<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9284.xslt, v2.0 december 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC041: IF (PrestatieCodelijstCode = 071 AND Ontvanger = 9992) OR PrestatieCodelijstCode = 083, THEN EXIST Plaatsingsbesluit
		 retourcode 9284: Plaatsingsbesluit ontbreekt of is onjuist.-->
	<xsl:template name="rc9284">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Plaatsingsbesluit"/>
		<xsl:if test="(($PrestatieCodelijstCode='071' and $Ontvanger='9992') or $PrestatieCodelijstCode='083') and not($Plaatsingsbesluit)">
			<gds802:Feedback>
				<gds802:Retourcode>9284</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrestatieCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Ontvanger)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Ontvanger"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>