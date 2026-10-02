<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9797.xslt, augustus 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC172: Indien versie = 1.0, dan moet Begindatum van de DebetPrestatie kleiner zijn dan 1-1-2027.   -->
	<xsl:template name="rc9798">
		<xsl:param name="Begindatum"/>
		<xsl:if test="not(translate($Begindatum,'-','') &lt; '20270101')">
			<gds802:Feedback>
				<gds802:Retourcode>9798</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
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