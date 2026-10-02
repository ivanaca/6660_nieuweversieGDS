<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9567d.xslt, juni 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9567d: Indien PrestatieCodelijstCode = 078 (= Logopedie), dan moet DiagnoseCodelijstCode = 012 (= Paramedische diagnosecodelijst logopedie) voorkomen. -->
	<xsl:template name="rc9567d">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		<xsl:if test="($PrestatieCodelijstCode='078') and not($DiagnoseCodelijstCode='012')">
			<gds802:Feedback>
				<gds802:Retourcode>9567</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$DiagnoseCodelijstCode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($DiagnoseCodelijstCode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$DiagnoseCodelijstCode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
