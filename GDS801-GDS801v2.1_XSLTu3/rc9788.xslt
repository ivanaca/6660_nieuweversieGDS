<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9788.xslt, juli 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC169: Indien PrestatieCodelijstCode=081 (=Prestatiecodelijst Overig GDS) of = 082 (= Revalidatie- en herstelzorg)  of 083 (= ZZP, EP en VPT forensische zorg), dan moet ZorgaanbiederRol = 01 (= Behandelaar) voorkomen. | retourcode 9788: Behandelaar moet voorkomen. -->
	<xsl:template name="rc9788">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ZorgaanbiederRol"/>
		<xsl:if test="($PrestatieCodelijstCode='081' or $PrestatieCodelijstCode='082' or $PrestatieCodelijstCode='083') and not($ZorgaanbiederRol='01')">
			<gds802:Feedback>
				<gds802:Retourcode>9788</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrestatieCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$ZorgaanbiederRol">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($ZorgaanbiederRol)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$ZorgaanbiederRol"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>