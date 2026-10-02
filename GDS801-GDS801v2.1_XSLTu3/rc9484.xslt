<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9484u2.xslt, 7 september 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9484: Indien TypeVerwijzingcode = 07 (= Verwijzing aanwezig, maar verwijzer heeft geen AGB-code), dan moet Verwijzer/ZorgaanbiederSpecificatie voorkomen. -->
	<xsl:template name="rc9484">
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		
		
		<xsl:if test="$TypeVerwijzingcode = '07' and not($ZorgaanbiederSpecificatie)">
			<gds802:Feedback>
				<gds802:Retourcode>9484</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TypeVerwijzingcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TypeVerwijzingcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
