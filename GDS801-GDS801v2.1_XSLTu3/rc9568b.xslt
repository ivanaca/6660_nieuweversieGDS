<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9568b.xslt, juli 2024 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- retourcode 9568: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en PrivacyCode = Ja en DebetPrestatie/BeginDatum groter dan of gelijk aan 1-1-2024, dan mag Diagnose niet voorkomen. -->
	<xsl:template name="rc9568b">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="PrivacyCode"/>
		<xsl:param name="Begindatum"/>
		<xsl:param name="Diagnose"/>
		<xsl:if test="$PrestatieCodelijstCode='071' and $PrivacyCode='true' and not(normalize-space(translate($Begindatum,'-','')) &lt; '20240101')">
			<gds802:Feedback>
				<gds802:Retourcode>9568</gds802:Retourcode>
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
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>