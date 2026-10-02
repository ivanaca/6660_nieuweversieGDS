<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9552.xslt, u1 14 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9552: Indien Ontvanger niet = 7125 (= Orgaan van tijdelijk verblijf), dan mag InternationaalVerzekeringsbewijs niet voorkomen. -->
	<xsl:template name="rc9552">
		<xsl:param name="Ontvanger"/>
		
		<xsl:if test="(not($Ontvanger='7125'))">
			<gds802:Feedback>
				<gds802:Retourcode>9552</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
