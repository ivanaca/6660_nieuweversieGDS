<?xml version="1.0" encoding="UTF-8"?>
<!-- rcCode_vs_Peildatum.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:cod="http://ei.vektis.nl/codelijsten/v1"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
		
	<!-- deze routine voert de volgende controle uit: 
		 	- als Code een waarde bevat
				- controleer of Code voorkomt in de codelijst met bestandsnaam Codelijst; als Code niet voorkomt, dan wordt retourcode RetourcodeBestaanbaarheid geretourneerd; geen verdere controles
				- als Peildatum een waarde bevat
					- controleer of de ingangsdatum van Code kleiner of gelijk aan Peildatum is; als dit niet het geval is, dan wordt retourcode RetourcodeIngangsdatum geretourneerd
					- als Code een expiratiedatum heeft, controleer of Peildatum voor de expiratiedatum ligt; als dit niet het geval is, dan wordt retourcode RetourcodeExpiratiedatum geretourneerd -->
	
	<xsl:template name="rcCode_vs_Peildatum">
		<xsl:param name="Codelijst"/>
		<xsl:param name="RetourcodeBestaanbaarheid"/>
		<xsl:param name="RetourcodeIngangsdatum"/>
		<xsl:param name="RetourcodeExpiratiedatum"/>
		<xsl:param name="Code"/>
		<xsl:param name="Peildatum"/>
		
		<!-- als Code een waarde bevat, controleer Code -->
		<xsl:if test="$Code != ''">
			<!-- controleer of Code bestaat -->
			<xsl:choose>
				<xsl:when test="not(document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code])">
					<gds802:Feedback>
						<gds802:Retourcode><xsl:value-of select="$RetourcodeBestaanbaarheid"/></gds802:Retourcode>
							<!-- som de elementen op die de fout veroorzaken -->
							<gds802:BetrokkenElement>
								<gds802:Elementnaam><xsl:value-of select="local-name($Code)"/></gds802:Elementnaam>
								<gds802:Elementwaarde><xsl:value-of select="$Code"/></gds802:Elementwaarde>
							</gds802:BetrokkenElement>
					</gds802:Feedback>
				</xsl:when>
				<xsl:otherwise>
					<!-- als code bestaat en Peildatum is gevuld, verifieer of Code al bestond op Peildatum (er moet gelden: Ingangsdatum <= Peildatum) -->
					<xsl:if test="$Peildatum != '' and document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Ingangsdatum != '' and
								translate($Peildatum,'-','') &lt; translate(document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Ingangsdatum,'-','')">
						<gds802:Feedback>
							<gds802:Retourcode><xsl:value-of select="$RetourcodeIngangsdatum"/></gds802:Retourcode>
								<!-- som de elementen op die de fout veroorzaken -->
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="local-name($Code)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="$Code"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="local-name($Peildatum)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="$Peildatum"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="name(document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Ingangsdatum)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Ingangsdatum"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
						</gds802:Feedback>
					</xsl:if>
					<!-- als code bestaat en Peildatum is gevuld, verifieer of Code niet is geëxpireerd op Peildatum (er moet gelden: Peildatum < Expiratiedatum) -->
					<xsl:if test="$Peildatum != '' and document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Expiratiedatum != '' and 
								not(translate($Peildatum,'-','') &lt; translate(document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Expiratiedatum,'-',''))">
						<gds802:Feedback>
							<gds802:Retourcode><xsl:value-of select="$RetourcodeExpiratiedatum"/></gds802:Retourcode>
								<!-- som de elementen op die de fout veroorzaken -->
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="local-name($Code)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="$Code"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="local-name($Peildatum)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="$Peildatum"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="name(document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Expiratiedatum)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="document($Codelijst)/cod:Codelijst/cod:CodelijstElement[cod:Code=$Code]/cod:Expiratiedatum"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
						</gds802:Feedback>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
