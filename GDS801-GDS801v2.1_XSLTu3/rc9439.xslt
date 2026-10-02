<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9439.xslt, v2.0 maart 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC040: IF PrestatieCodelijstCode = 071|073|074|075|076|077|078|079|080|082|083, THEN EXIST Zorgtraject
		 retourcode 9439: Zorgtraject ontbreekt of is onjuist.. -->
	<xsl:template name="rc9439">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Zorgtraject"/>
		<xsl:if test="($PrestatieCodelijstCode='071' or $PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='082' or $PrestatieCodelijstCode='083') and not($Zorgtraject)">
			<gds802:Feedback>
				<gds802:Retourcode>9439</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
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