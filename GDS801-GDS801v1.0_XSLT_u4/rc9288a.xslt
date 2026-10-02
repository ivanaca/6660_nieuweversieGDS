<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9288a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9288: Indien DiagnoseCodelijstCode voorkomt, dan moet Diagnosecode voorkomen. -->
	<xsl:template name="rc9288a">
		<xsl:param name="DiagnoseCodelijstCode"/>
		<xsl:param name="Diagnosecode"/>
		
		<xsl:if test="$DiagnoseCodelijstCode and not($Diagnosecode)">
			<gds802:Feedback>
				<gds802:Retourcode>9288</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($DiagnoseCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$DiagnoseCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
