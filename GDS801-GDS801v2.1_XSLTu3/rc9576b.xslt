<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9576b.xslt, 8 november 2024-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- retourcode 9576b: Indien PrestatieCodelijstCode = 080 (= Podotherapie) en OntvangerRol niet = 2 (= Servicebureau), dan mag Commentaar niet voorkomen. -->
	<xsl:template name="rc9576b">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="Commentaar"/>
		<xsl:if test="$PrestatieCodelijstCode='080' and not($OntvangerRol='2') and $Commentaar">
			<gds802:Feedback>
				<gds802:Retourcode>9576</gds802:Retourcode>
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
						<xsl:value-of select="local-name($OntvangerRol)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$OntvangerRol"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($Commentaar)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$Commentaar"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>