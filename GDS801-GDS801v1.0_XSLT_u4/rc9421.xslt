<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9421.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9421: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ApkCodelijstCode voorkomt, dan moet ApkCodelijstCode = ‘001’ (= Zorglabelcodelijst GGZ en FZ volgens ZPM) voorkomen. -->
	<xsl:template name="rc9421">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ApkCodelijstCode"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and $ApkCodelijstCode and not($ApkCodelijstCode='001')">
			<gds802:Feedback>
				<gds802:Retourcode>9421</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ApkCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ApkCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
