<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9281.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9281: Indien Zorgaanbieder voorkomt, dan mag ZorgaanbiederRol niet 03 (verwijzer) of 04 (diagnosesteller) zijn. -->
	<xsl:template name="rc9281">
		<xsl:param name="Zorgaanbieder"/>
		<xsl:param name="ZorgaanbiederRol"/>
		
		<xsl:if test="$Zorgaanbieder and ($ZorgaanbiederRol='03' or $ZorgaanbiederRol='04')">
			<gds802:Feedback>
				<gds802:Retourcode>9281</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<xsl:if test="$Zorgaanbieder/gds801:Zorgaanbiedercode">
					<!-- <gds802:Zorgaanbiedercode> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:Zorgaanbiedercode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:Zorgaanbiedercode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>	
				<xsl:if test="$Zorgaanbieder/gds801:ZorgaanbiederSoort">
					<!-- <gds802:ZorgaanbiederSoort> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:ZorgaanbiederSoort)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:ZorgaanbiederSoort"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>					
				</xsl:if>
				<xsl:if test="$Zorgaanbieder/gds801:ZorgaanbiederSpecificatie">
					<!-- <gds802:ZorgaanbiederSpecificatie> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>					
				</xsl:if>
				<xsl:if test="$Zorgaanbieder/gds801:NaamZorgverlener">
						<!-- <gds802:NaamZorgverlener> -->
						<xsl:if test="$Zorgaanbieder/gds801:NaamZorgverlener/gds801:Initialen">
							<gds802:BetrokkenElement>
								<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:NaamZorgverlener/gds801:Initialen)"/></gds802:Elementnaam>
								<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:NaamZorgverlener/gds801:Initialen"/></gds802:Elementwaarde>
							</gds802:BetrokkenElement>		
						</xsl:if>					
						<xsl:if test="$Zorgaanbieder/gds801:NaamZorgverlener/gds801:Geslachtsnaam">
							<!-- <gds802:Geslachtsnaam>	-->
							<xsl:if test="$Zorgaanbieder/gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels">
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
							</xsl:if>	
							<gds802:BetrokkenElement>
								<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Achternaam)"/></gds802:Elementnaam>
								<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Achternaam"/></gds802:Elementwaarde>
							</gds802:BetrokkenElement>
							<!-- </gds802:Geslachtsnaam>	-->
						</xsl:if>
						<!-- </gds802:NaamZorgverlener>	-->
				</xsl:if>
				<xsl:if test="$Zorgaanbieder/gds801:BeroepZorgverlener">
					<!-- <gds802:BeroepZorgverlener> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:BeroepZorgverlener)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:BeroepZorgverlener"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>					
				</xsl:if>
				<xsl:if test="$Zorgaanbieder/gds801:ZorgaanbiederRol">
					<!-- <gds802:ZorgaanbiederRol> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbieder/gds801:ZorgaanbiederRol)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbieder/gds801:ZorgaanbiederRol"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>					
				</xsl:if>					
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
