<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9266b.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9266: Indien BegindatumDeclaratieperiode niet voorkomt, dan mag EinddatumDeclaratieperiode niet voorkomen. -->
	<xsl:template name="rc9266b">
		<xsl:param name="BegindatumDeclaratieperiode"/>
		<xsl:param name="EinddatumDeclaratieperiode"/>

		<xsl:if test="not($BegindatumDeclaratieperiode) and $EinddatumDeclaratieperiode">
			<gds802:Feedback>
				<gds802:Retourcode>9266</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($EinddatumDeclaratieperiode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$EinddatumDeclaratieperiode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
