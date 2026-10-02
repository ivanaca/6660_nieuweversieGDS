<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9287b.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9287: Indien PrestatieCodelijstCode = 071 (= NZa Codelijst ZPM) en DiagnoseCodelijstCode voorkomt en PrivacyCode = Nee, dan moet waarde DiagnoseCodelijstCode 029 (= DSM-hoofdgroep GGZ), 030 (= DSM-hoofdgroep FZ), 031 (= Zorgvraagtypering GGZ), 032 (= Zorgvraagtypering FZ) of 033 (= GB-ggz Profiel) voorkomen. -->
	<xsl:template name="rc9287b">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		<xsl:param name="PrivacyCode"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and $DiagnoseCodelijstCode and $PrivacyCode='false' and not($DiagnoseCodelijstCode='029' or $DiagnoseCodelijstCode='030' or $DiagnoseCodelijstCode='031' or $DiagnoseCodelijstCode='032' or $DiagnoseCodelijstCode='033')">
			<gds802:Feedback>
				<gds802:Retourcode>9287</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($DiagnoseCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$DiagnoseCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrivacyCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrivacyCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
