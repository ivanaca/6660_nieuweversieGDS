<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8166b.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8166: Indien InformatiesysteemCode niet voorkomt, dan mag InformatiesysteemVersie niet voorkomen. -->
	<xsl:template name="rc8166b">
		<xsl:param name="InformatiesysteemCode"/>
		<xsl:param name="InformatiesysteemVersie"/>

		<xsl:if test="not($InformatiesysteemCode) and $InformatiesysteemVersie">
			<gds802:Feedback>
				<gds802:Retourcode>8166</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($InformatiesysteemVersie)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$InformatiesysteemVersie"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
