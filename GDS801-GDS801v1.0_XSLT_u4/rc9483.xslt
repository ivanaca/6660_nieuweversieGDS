<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9483.xslt, u2, 24 mei 2022 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9483: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger = 9992 (= DJI/FZ) en Verwijzing komt voor, dan mag TypeVerwijzingcode alleen = 06 (= Geen verwijzing, andere rechtsmatigheidgrond) zijn. -->
	<xsl:template name="rc9483">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="TypeVerwijzingcode"/>
		
		
		<xsl:if test="$PrestatieCodelijstCode = '071'">
			<xsl:if test=" ($Ontvanger = '9992' and $TypeVerwijzingcode != '06') 
                           or 
                               ($Ontvanger != '9992' and $TypeVerwijzingcode = '06') ">
				<gds802:Feedback>
					<gds802:Retourcode>9483</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<xsl:if test="$TypeVerwijzingcode">
						<gds802:BetrokkenElement>
							<gds802:Elementnaam><xsl:value-of select="local-name($TypeVerwijzingcode)"/></gds802:Elementnaam>
							<gds802:Elementwaarde><xsl:value-of select="$TypeVerwijzingcode"/></gds802:Elementwaarde>
						</gds802:BetrokkenElement>
					</xsl:if>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
