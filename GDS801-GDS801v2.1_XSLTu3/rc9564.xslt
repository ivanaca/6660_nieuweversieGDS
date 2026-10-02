<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9564.xslt, 17 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9564: Indien PrestatieCodelijstCode = (076 (= Diëtetiek) of 077 (= Ergotherapie) of 078 (= Logopedie)) en AanvullenPrestatieKenmerk voorkomt, dan moet ApkCodelijstCode = 003 (= Overige prestatie-indicatie) voorkomen. -->
	<xsl:template name="rc9564">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ApkCodelijstcode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078') and not($ApkCodelijstcode='003')">
			<gds802:Feedback>
				<gds802:Retourcode>9564</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ApkCodelijstcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ApkCodelijstcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
