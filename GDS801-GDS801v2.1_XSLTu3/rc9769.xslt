<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9769.xslt, nov-2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!--VC162: Indien Ontvanger = 3356 (= SOV) of 9989 (= OVV), dan moet Nationaliteit voorkomen. 
		retourcode 9769: Nationaliteit ontbreekt of is onjuist. -->
	<xsl:template name="rc9769">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Nationaliteit"/>
		<xsl:if test="($Ontvanger='3356' or $Ontvanger='9989') and not($Nationaliteit)">
			<gds802:Feedback>
				<gds802:Retourcode>9769</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Ontvanger)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Ontvanger"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>