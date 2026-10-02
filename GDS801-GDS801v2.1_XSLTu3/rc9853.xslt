<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9853.xslt, juni 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!--VC183: Indien PrestatieCodelijstCode = 071 (= Geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger niet = 9992 (= DJI) en niet =  3356 (= SOV) en niet =  9989 (= OVV)) en Begindatum groter dan of gelijk aan 01-01-2027, dan moet Berichtversie groter dan of gelijk zijn aan 2 en moet Berichtsubversie groter dan of gelijk zijn aan 1.
		retourcode 9853: GGZ prestaties vanaf 1-1-2027 moeten met GDS801 versie 2.1  of hoger worden ingediend. -->
	<xsl:template name="rc9853">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Begindatum"/>
		<xsl:param name="Berichtversie"/>
		<xsl:param name="Berichtsubversie"/>
		<xsl:if test="$PrestatieCodelijstCode='071' and not($Ontvanger=9992 or $Ontvanger=3356 or $Ontvanger=9989) and (normalize-space(translate($Begindatum,'-','')) &gt;= '20270101') and (($Berichtversie &lt; '2') or (($Berichtversie='2') and ($Berichtsubversie &lt; '1')))">
			<gds802:Feedback>
				<gds802:Retourcode>9853</gds802:Retourcode>
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
						<xsl:value-of select="local-name($Begindatum)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Begindatum"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Berichtversie)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Berichtversie"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Berichtsubversie)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Berichtsubversie"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>