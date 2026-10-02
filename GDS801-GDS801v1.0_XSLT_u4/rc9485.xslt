<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9485.xslt v2, 30 maart 2022 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9485: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvangerrol niet = 2 (= Servicebureau), dan mag TypeVerwijzingcode niet = 05 (= Geen verwijzing) zijn. -->
	<xsl:template name="rc9485">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:param name="OntvangerRol"/>
		
		<xsl:if test="($PrestatieCodelijstCode = '071' and $TypeVerwijzingcode = '05' and not($OntvangerRol = '2'))">
			<gds802:Feedback>
				<gds802:Retourcode>9485</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($OntvangerRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$OntvangerRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TypeVerwijzingcode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TypeVerwijzingcode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
