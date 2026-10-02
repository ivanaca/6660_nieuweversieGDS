<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9423.xslt, juli 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC067: Indien PrestatieCodelijstCode niet = 071 (= Geestelijke gezondheidszorg en forensische zorg volgens ZPM) of 083 (= ZZP, EP en VPT forensische zorg), dan mag BeroepZorgverlener niet voorkomen. | retourcode 9423: Zorgaanbieder/BeroepZorgverlener mag niet voorkomen. -->
	<xsl:template name="rc9423">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="BeroepZorgverlener"/>
		<xsl:if test="not($PrestatieCodelijstCode='071' or $PrestatieCodelijstCode='083') and $BeroepZorgverlener">
			<gds802:Feedback>
				<gds802:Retourcode>9423</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<xsl:if test="$PrestatieCodelijstCode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$PrestatieCodelijstCode"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
				<xsl:if test="$BeroepZorgverlener">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($BeroepZorgverlener)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$BeroepZorgverlener"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>