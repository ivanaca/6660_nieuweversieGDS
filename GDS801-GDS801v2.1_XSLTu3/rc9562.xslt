<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9562.xslt, 17 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9562: Indien PrestatieCodelijstCode =  073 (= Fysiotherapie) of 074 (= Oefentherapie) en AanvullenPrestatieKenmerk voorkomt, dan moet ApkCodelijstCode = 002 (= ToelichtingLichaamsLocatie) of 003 (= Overige prestatie-indicatie) of 004 (= Aanspraakcode) voorkomen. -->
	<xsl:template name="rc9562">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ApkCodelijstCode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074') and not($ApkCodelijstCode='002' or $ApkCodelijstCode='003' or $ApkCodelijstCode='004')">
			<gds802:Feedback>
				<gds802:Retourcode>9562</gds802:Retourcode>
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
