<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9482.xslt, v1.0u2 14-04-2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9482: Indien TypeVerwijzingcode = 04 (= Geen verwijzing aanwezig vanwege uitzondering, door patiënt geen correspondentie toegestaan) of 05 (= Geen verwijzing) of 06 (= Geen verwijzing, andere rechtsmatigheidgrond), dan mag Verwijzer en Verwijsdatum niet voorkomen. -->
	<xsl:template name="rc9482">
		<xsl:param name="TypeVerwijzingcode"/>
		<xsl:param name="Verwijzer"/>
		<xsl:param name="Verwijsdatum"/>
		
		
		<xsl:if test="$TypeVerwijzingcode= '04' or $TypeVerwijzingcode= '05' or $TypeVerwijzingcode= '06' ">
			<xsl:if test="$Verwijzer or $Verwijsdatum">
				<gds802:Feedback>
					<gds802:Retourcode>9482</gds802:Retourcode>
					<!-- som de elementen op die de fout veroorzaken -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($TypeVerwijzingcode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$TypeVerwijzingcode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
					<xsl:if test="$Verwijzer">
						<xsl:if test="$Verwijzer/gds801:Zorgaanbiedercode">
							<gds802:BetrokkenElement>
								<gds802:Elementnaam><xsl:value-of select="local-name($Verwijzer/gds801:Zorgaanbiedercode)"/></gds802:Elementnaam>
								<gds802:Elementwaarde><xsl:value-of select="$Verwijzer/gds801:Zorgaanbiedercode"/></gds802:Elementwaarde>
							</gds802:BetrokkenElement>		
						</xsl:if>					
					</xsl:if>					
					<xsl:if test="$Verwijsdatum">
						<gds802:BetrokkenElement>
							<gds802:Elementnaam><xsl:value-of select="local-name($Verwijsdatum)"/></gds802:Elementnaam>
							<gds802:Elementwaarde><xsl:value-of select="$Verwijsdatum"/></gds802:Elementwaarde>
						</gds802:BetrokkenElement>
					</xsl:if>	
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
