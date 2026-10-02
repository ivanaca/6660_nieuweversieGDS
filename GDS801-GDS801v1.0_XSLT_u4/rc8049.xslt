<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8049.xslt, 6 oktober 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">


	<!-- retourcode 8049: Indien Prestatiecodelijst = 071, dan moet Aantal gelijk zijn aan ‘1’.  -->
	<xsl:template name="rc8049">
		<xsl:param name="Aantal"/>
		<xsl:param name="PrestatieCodelijstCode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='071') and not($Aantal = '1')">
			<gds802:Feedback>
				<gds802:Retourcode>8049</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
				<xsl:if test="$Aantal">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Aantal)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Aantal"/></gds802:Elementwaarde>
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
