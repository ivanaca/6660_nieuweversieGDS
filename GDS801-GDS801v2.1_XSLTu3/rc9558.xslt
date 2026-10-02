<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9558.xslt, v2.0u2 mei 2025 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9558: Indien PrestatieCodelijstCode = (073 (= Fysiotherapie) of 074 (= Oefentherapie) of 075 (= Huidtherapie) of 076 (= Diëtetiek) of 077 (= Ergotherapie) of 078 (= Logopedie) of 079 (= GLI) of 080 (= Podotherapie) of 082 (= Revalidatie en herstelzorg)), dan mag Verwijzing maximaal 1 keer voorkomen. -->
	<xsl:template name="rc9558">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Verwijzing"/>
		
		<xsl:if test="(($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='082') and count($Verwijzing)>1 )">
			<gds802:Feedback>
				<gds802:Retourcode>9558</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Verwijzing)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="count($Verwijzing)"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
