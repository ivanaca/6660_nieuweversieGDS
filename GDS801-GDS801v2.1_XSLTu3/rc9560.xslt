<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9560.xslt, v2.0 december 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC125: IF PrestatieCodelijstCode = 075|079|080|082|083, THEN NOT EXIST  ZorgaanbiederRol = 02 
		 retourcode 9560: Regiebehandelaar mag niet voorkomen. -->
	<xsl:template name="rc9560">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgaanbiederRol"/>
		<xsl:if test="($PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='082' or $PrestatieCodelijstCode='083') and $ZorgaanbiederRol='02'">
			<gds802:Feedback>
				<gds802:Retourcode>9560</gds802:Retourcode>
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
						<xsl:value-of select="local-name($ZorgaanbiederRol)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$ZorgaanbiederRol"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>