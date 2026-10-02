<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9419b.xslt, v2.0 december 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC130: IF PrestatieCodelijstCode <> 071|083|999, THEN NOT EXIST Plaatsingsbesluit
		 retourcode 9419: Plaatsingsbesluit mag niet voorkomen.-->
	<xsl:template name="rc9419b">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Plaatsingsbesluit"/>
		<xsl:param name="PlaatsingsbesluitNummer"/>
		<xsl:if test="not($PrestatieCodelijstCode='071') and not($PrestatieCodelijstCode='083') and not($PrestatieCodelijstCode='999') and ($Plaatsingsbesluit)">
			<gds802:Feedback>
				<gds802:Retourcode>9419</gds802:Retourcode>
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
						<xsl:value-of select="local-name($PlaatsingsbesluitNummer)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PlaatsingsbesluitNummer"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>