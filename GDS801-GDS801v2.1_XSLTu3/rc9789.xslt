<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9789.xslt, v2.0u1 mei 2025 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9789: Indien PrestatieCodelijstCode = 082 (= Revalidatie- en herstelzorg), dan moet ApkCodelijstCode 005 (= Zorg revalidatie en herstelzorg) voorkomen. -->
	<xsl:template name="rc9789">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ApkCodelijstCode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='082') and not($ApkCodelijstCode='005')">
			<gds802:Feedback>
				<gds802:Retourcode>9789</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$ApkCodelijstCode">				
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ApkCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ApkCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>	
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
