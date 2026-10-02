<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9852.xslt, juni 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC182: Indien PrestatieCodelijstCode = 071 (= Geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger = 9992 (DJI) of = 3356 (= SOV) of = 9989 (= OVV), dan mag LocatiePostcode4 niet voorkomen.
		 retourcode 9852: LocatiePostcode4 mag niet voorkomen voor deze Ontvanger. -->
	<xsl:template name="rc9852">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="LocatiePostcode4"/>
		<xsl:if test="($PrestatieCodelijstCode='071') and ($Ontvanger=9992 or $Ontvanger=3356 or $Ontvanger=9989) and $LocatiePostcode4">
			<gds802:Feedback>
				<gds802:Retourcode>9852</gds802:Retourcode>
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
						<xsl:value-of select="local-name($Ontvanger)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Ontvanger"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($LocatiePostcode4)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$LocatiePostcode4"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>