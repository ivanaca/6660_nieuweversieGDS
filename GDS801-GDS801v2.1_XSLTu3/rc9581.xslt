<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9581.xslt, juli 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC153: IF PrestatieCodelijstCode = 079|080|083, THEN NOT EXIST AanvullendPrestatieKenmerk
		 retourcode 9581: AanvullendPrestatieKenmerk mag niet voorkomen. -->
	<xsl:template name="rc9581">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:if test="(($PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='083'))">
			<gds802:Feedback>
				<gds802:Retourcode>9581</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrestatieCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>