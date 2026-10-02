<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9566.xslt, u1 15 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9566: Indien PrestatieCodelijstCode = 073 (= Fysiotherapie) of 074 (= Oefentherapie) of 075 (= Huidtherapie) of 076(= Diëtetiek) of 077 (= Ergotherapie) of 078 (= Logopedie) of 079 (= GLI) of 080 (= Podotherapie) of 081 (= Overig GDS)) en Verwijzer voorkomt, dan moet Verwijsdatum voorkomen. -->
	<xsl:template name="rc9566">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Verwijzer"/>
		<xsl:param name="Verwijsdatum"/>
		
		<xsl:if test="(($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='081') and $Verwijzer and not($Verwijsdatum))">
			<gds802:Feedback>
				<gds802:Retourcode>9566</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
