<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8101.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8101: Indien BSN niet voorkomt, dan moet Verzekerdennummer voorkomen. -->
	<xsl:template name="rc8101">
		<xsl:param name="BSN"/>
		<xsl:param name="Verzekerdennummer"/>

		<xsl:if test="not($BSN) and not($Verzekerdennummer)">
			<gds802:Feedback>
				<gds802:Retourcode>8101</gds802:Retourcode>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
