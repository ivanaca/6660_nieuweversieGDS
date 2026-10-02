<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9563.xslt, september 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9563: Indien PrestatieCodelijstCode =  075 (= Huidtherapie) en AanvullenPrestatieKenmerk voorkomt, dan moet ApkCodelijstCode = 002 (= ToelichtingLichaamsLocatie) of 004 (= Aanspraakcode)) voorkomen. -->
	<xsl:template name="rc9563">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="ApkCodelijstcode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='075') and not($ApkCodelijstcode='002' or $ApkCodelijstcode='004')">
			<gds802:Feedback>
				<gds802:Retourcode>9563</gds802:Retourcode>
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
