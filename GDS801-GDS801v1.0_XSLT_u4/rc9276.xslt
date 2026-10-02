<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9276.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9276: Indien OverlijdensIndicator  = Ja (= Overleden), dan moet SoortRelatie voorkomen. -->
	<xsl:template name="rc9276">
		<xsl:param name="OverlijdensIndicator"/>
		<xsl:param name="SoortRelatie"/>
		
		<xsl:if test="$OverlijdensIndicator='true' and not($SoortRelatie)">
			<gds802:Feedback>
				<gds802:Retourcode>9276</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OverlijdensIndicator)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OverlijdensIndicator"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
