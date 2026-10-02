<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9456.xslt, v2.0u2 mei 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC081: IF Berichtcode = 573, THEN PrestatieCodelijstCode = 071|073|074|075|076|077|078|079|080|081|082|083|999
		 retourcode 9456: CreditPrestatie/PrestatieCodelijstCode ontbreekt of is onjuist. -->
	<xsl:template name="rc9456">
		<xsl:param name="Berichtcode"/>
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:if test="$Berichtcode=573 and not($PrestatieCodelijstCode='071' or $PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='081' or $PrestatieCodelijstCode='082' or $PrestatieCodelijstCode='083' or $PrestatieCodelijstCode='999')">
			<gds802:Feedback>
				<gds802:Retourcode>9456</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Berichtcode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Berichtcode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrestatieCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>