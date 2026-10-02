<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9544.xslt v1, 13 januari 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9544: Indien Ontvangerrol is ongelijk 02 (= Servicebureau), dan mag PrestatieCodelijstCode met waarde 999 = ((Onderdeel van een) prestatie waarvoor geen code bestaat) niet voorkomen. -->
	<xsl:template name="rc9544">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="OntvangerRol"/>
		
		<xsl:if test="($PrestatieCodelijstCode = '999' and not($OntvangerRol = '2'))">
			<gds802:Feedback>
				<gds802:Retourcode>9544</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
