<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9553.xslt, u1 15 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9553: Indien Ontvanger niet = 7125 (= Orgaan van tijdelijk verblijf), dan mag Verzekerdenummer niet meer dan 15 posities bevatten. -->
	<xsl:template name="rc9553">
		<xsl:param name="Ontvanger"/>
		<xsl:param name="Verzekerdennummer"/>
		
		<xsl:if test="(not($Ontvanger='7125')) and string-length($Verzekerdennummer) &gt;15">
			<gds802:Feedback>
				<gds802:Retourcode>9553</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Ontvanger)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Ontvanger"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Verzekerdennummer)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Verzekerdennummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
