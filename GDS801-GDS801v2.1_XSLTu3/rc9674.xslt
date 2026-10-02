<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9674.xslt, u1 - januari 2024 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9674: Indien PrestatieCodelijstCode = (073 (= Fysiotherapie) of 074 (= Oefentherapie) of 075 (= Huidtherapie) of 076 (= Diëtetiek) of 077 (= Ergotherapie) of 078 (= Logopedie) of 079 (= GLI) of 080 (= Podotherapie)), dan mag Diagnose maximaal 1 keer voorkomen. -->
	<xsl:template name="rc9674">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Diagnose"/>
		
		<xsl:if test="(($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080') and count($Diagnose)>1 )">
			<gds802:Feedback>
				<gds802:Retourcode>9674</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>Aantal Diagnoses</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="count($Diagnose)"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
