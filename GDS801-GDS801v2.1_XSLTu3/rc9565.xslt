<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9565.xslt, april 2026 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC131: Indien PrestatieCodelijstCode = 073 (= Fysiotherapie) of 074 (= Oefentherapie) of 075 (= Huidtherapie) of 076 (= Diëtetiek) of 077 (= Ergotherapie) of 078 (= Logopedie) of 079 (= GLI) of 080 (= Podotherapie) of 082 (= Prestatiecodelijst Revalidatie- en herstelzorg) en Verwijzing voorkomt, dan moet TypeVerwijzingcode = 01(= Verwijzing aanwezig) of 07 (= Verwijzing aanwezig, maar verwijzer heeft geen AGB-code) voorkomen. -->
	<xsl:template name="rc9565">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:if test="(($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='082') and not($TypeVerwijzingcode = '01' or $TypeVerwijzingcode = '07'))">
			<gds802:Feedback>
				<gds802:Retourcode>9565</gds802:Retourcode>
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