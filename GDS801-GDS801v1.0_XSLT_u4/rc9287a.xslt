<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9287a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9287: Indien Diagnose voorkomt en PrivacyCode = Nee, dan moet DiagnoseCodelijstCode voorkomen. -->
	<xsl:template name="rc9287a">
		<xsl:param name="PrivacyCode"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		<xsl:if test="$PrivacyCode='false' and not($DiagnoseCodelijstCode)">
			<gds802:Feedback>
				<gds802:Retourcode>9287</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrivacyCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrivacyCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
