<?xml version="1.0" encoding="UTF-8"?>
<!-- rc8062.xslt, 10 dec 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 8062: Controle of debetregels in hetzelfde bericht gecrediteerd worden (hetgeen niet mag). 
		  De waarde van CreditPrestatie/GerelateerdReferentienummer mag niet gelijk zijn aan de waarde van DebetPrestatie/Referentienummer in bericht. -->
	<xsl:template name="rc8062">
		<xsl:param name="GerelateerdReferentienummer"/>
		
		<xsl:if test="key('DebetReferentienummer', gds801:GerelateerdReferentienummer)">
			<gds802:Feedback>
				<gds802:Retourcode>8062</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($GerelateerdReferentienummer)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$GerelateerdReferentienummer"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>	
	</xsl:template>
</xsl:stylesheet>
