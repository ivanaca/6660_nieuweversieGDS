<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9803.xslt, v2.0 december 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC175: IF PrestatieCodelijstCode = 083 THEN NOT EXIST Verwijzing 
		 retourcode 9803: Verwijzing mag niet voorkomen. -->
	<xsl:template name="rc9803">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:if test="($PrestatieCodelijstCode='083')">
			<gds802:Feedback>
				<gds802:Retourcode>9803</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($PrestatieCodelijstCode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$PrestatieCodelijstCode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($TypeVerwijzingcode)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$TypeVerwijzingcode"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>