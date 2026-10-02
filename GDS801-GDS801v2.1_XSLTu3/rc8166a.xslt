<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8166a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8166: Indien InformatiesysteemCode voorkomt, dan moet ook InformatiesysteemVersie voorkomen. -->
	<xsl:template name="rc8166a">
		<xsl:param name="InformatiesysteemCode"/>
		<xsl:param name="InformatiesysteemVersie"/>

		<xsl:if test="$InformatiesysteemCode and not($InformatiesysteemVersie)">
			<gds802:Feedback>
				<gds802:Retourcode>8166</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($InformatiesysteemCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$InformatiesysteemCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
