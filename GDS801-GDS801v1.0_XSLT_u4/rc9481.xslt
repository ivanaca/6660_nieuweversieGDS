<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9481.xslt, 17 december 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9481: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en TypeVerwijzingcode = 01 (= Verwijzing aanwezig) of 02 (= Doorverwijzing), dan moet Verwijzer/ Zorgaanbiedercode voorkomen. -->
	<xsl:template name="rc9481">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:param name="Zorgaanbiedercode"/>
		
		
		<xsl:if test="$PrestatieCodelijstCode = '071' and ($TypeVerwijzingcode='01' or $TypeVerwijzingcode='02') ">
			<xsl:if test="not($Zorgaanbiedercode)">
				<gds802:Feedback>
					<gds802:Retourcode>9481</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($TypeVerwijzingcode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$TypeVerwijzingcode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
