<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9266a.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9266: Indien BegindatumDeclaratieperiode voorkomt, dan moet EinddatumDeclaratieperiode voorkomen. -->
	<xsl:template name="rc9266a">
		<xsl:param name="BegindatumDeclaratieperiode"/>
		<xsl:param name="EinddatumDeclaratieperiode"/>

		<xsl:if test="$BegindatumDeclaratieperiode and not($EinddatumDeclaratieperiode)">
			<gds802:Feedback>
				<gds802:Retourcode>9266</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BegindatumDeclaratieperiode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BegindatumDeclaratieperiode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
