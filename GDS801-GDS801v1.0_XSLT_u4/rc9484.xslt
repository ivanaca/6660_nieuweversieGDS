<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9484.xslt, 17 december 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9484: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en TypeVerwijzingcode = 07 (= Verwijzing aanwezig, maar verwijzer heeft geen AGB-code), dan moet Verwijzer/ZorgaanbiederSpecificatie voorkomen. -->
	<xsl:template name="rc9484">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		
		
		<xsl:if test="$PrestatieCodelijstCode = '071' and $TypeVerwijzingcode = '07' ">
			<xsl:if test="not($ZorgaanbiederSpecificatie)">
				<gds802:Feedback>
					<gds802:Retourcode>9484</gds802:Retourcode>
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
