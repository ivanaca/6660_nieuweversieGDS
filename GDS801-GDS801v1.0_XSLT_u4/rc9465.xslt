<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9465.xslt, 6 oktober 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">


	<!-- retourcode 9465: Indien Prestatiecodelijst = 071, dan mag Einddatum niet voorkomen.  -->
	<xsl:template name="rc9465">
		<xsl:param name="Einddatum"/>
		<xsl:param name="PrestatieCodelijstCode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='071') and ($Einddatum)">
			<gds802:Feedback>
				<gds802:Retourcode>9465</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
				<xsl:if test="$Einddatum">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Einddatum)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Einddatum"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>	
				<xsl:if test="$PrestatieCodelijstCode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>	
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
