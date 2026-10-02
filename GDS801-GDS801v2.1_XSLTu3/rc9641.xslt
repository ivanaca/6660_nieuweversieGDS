<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9641.xslt, v2.0 december 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC141: IF PrestatieCodelijstCode = 071|079|083 THEN NOT EXIST IndicatieOngeval
		 retourcode 9641: IndicatieOngeval mag niet voorkomen. -->
	<xsl:template name="rc9641">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="IndicatieOngeval"/>
		<xsl:if test="(($PrestatieCodelijstCode='071' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='083') and $IndicatieOngeval)">
			<gds802:Feedback>
				<gds802:Retourcode>9641</gds802:Retourcode>
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
						<xsl:value-of select="local-name($IndicatieOngeval)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$IndicatieOngeval"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>