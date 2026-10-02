<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9797.xslt, augustus 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- XMLv1.0  ondersteunt geen controle via reguliere expressie op SEPA tekens. Dus vindt de controle in 3 stappen plaats.
Stap 1 gedefinieerde toegestane tekens
Stap 2 strip alles wat toegestaan is
Stap 3 check of er iets overblijft (dus: ongeldige tekens)
-->

	<!-- VC171: Indien Factuurdatum groter dan of gelijk aan 1-1-2026, dan moet Factuurnummer voldoen aan de SEPA waarden. -->
	<xsl:template name="rc9797">
		<xsl:param name="Factuurnummer"/>
		<xsl:param name="Factuurdatum"/>
		 <!-- Alleen controleren als datum >= 1 jan 2026 -->
    <xsl:if test="(translate($Factuurdatum,'-','') &gt;= '20260101')">

      <!-- Stap 1: toegestane SEPA-tekens -->
      <xsl:variable name="allowed">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789/-?:().,'+ </xsl:variable>

      <!-- Stap 2: verwijder alle toegestane tekens uit het factuurnummer -->
      <xsl:variable name="invalidChars" select="translate($Factuurnummer, $allowed, '')"/>

      <!-- Stap 3: als er nog tekens over zijn, dan zijn dat ongeldige -->
      <xsl:if test="string-length($invalidChars) &gt; 0">
				<gds802:Feedback>
					<gds802:Retourcode>9797</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($Factuurnummer)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$Factuurnummer"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<gds802:BetrokkenElement>
						<gds802:Elementnaam>
							<xsl:value-of select="local-name($Factuurdatum)"/>
						</gds802:Elementnaam>
						<gds802:Elementwaarde>
							<xsl:value-of select="$Factuurdatum"/>
						</gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>