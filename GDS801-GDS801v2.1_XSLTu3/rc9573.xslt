<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9573.xslt, v2.0 december  2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC145: IF PrestatieCodelijstCode = 071|073|074|075|076|077|078|079|080|081|082|083, THEN NOT EXIST ZorgtrajectSubnummer
		 retourcode 9573: ZorgtrajectSubnummer mag niet voorkomen. -->
	<xsl:template name="rc9573">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgtrajectSubnummer"/>
		<xsl:if test="(($PrestatieCodelijstCode='071' or $PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='081' or $PrestatieCodelijstCode='082' or $PrestatieCodelijstCode='083') and $ZorgtrajectSubnummer)">
			<gds802:Feedback>
				<gds802:Retourcode>9573</gds802:Retourcode>
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
						<xsl:value-of select="local-name($ZorgtrajectSubnummer)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$ZorgtrajectSubnummer"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>