<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9282.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9282: Indien Ontvanger = 9992 (= DJI/FZ), dan mag Herdeclaratiecode 02 (= Initiële declaratie na afwijzing door of creditering bij andere zorgverzekeraar) niet voorkomen. -->
	<xsl:template name="rc9282">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Herdeclaratiecode"/>
		
		<xsl:if test="($Ontvanger=9992) and $Herdeclaratiecode='02'">
			<gds802:Feedback>
				<gds802:Retourcode>9282</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Herdeclaratiecode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Herdeclaratiecode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
