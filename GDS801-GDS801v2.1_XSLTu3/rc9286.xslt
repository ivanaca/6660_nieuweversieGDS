<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9286.xslt, juli 2024 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- retourcode 9286: Indien PrestatieCodelijstCode = 071 (= NZa Codelijst ZPM en PrivacyCode = Ja, dan mag DiagnoseCodelijstCode waarde 029 (= DSM-hoofdgroep GGZ), 030 (= DSM- hoofdgroep FZ), 031 (= Zorgvraagtypering GGZ) en 032 (= Zorgvraagtypering FZ) niet voorkomen. -->
	<xsl:template name="rc9286">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="PrivacyCode"/>
		<xsl:param name="Begindatum"/>
		<xsl:param name="DiagnoseCodelijstCode"/>
		
		<xsl:if test="$PrestatieCodelijstCode='071' and $PrivacyCode='true' and (normalize-space(translate($Begindatum,'-','')) &lt; '20240101') and ($DiagnoseCodelijstCode='029' or $DiagnoseCodelijstCode='030' or $DiagnoseCodelijstCode='031' or $DiagnoseCodelijstCode='032')">
			<gds802:Feedback>
				<gds802:Retourcode>9286</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrestatieCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrivacyCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrivacyCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Begindatum)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Begindatum"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($DiagnoseCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$DiagnoseCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>