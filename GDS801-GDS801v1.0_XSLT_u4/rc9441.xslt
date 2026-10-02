<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9441.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds801="http://ei.vektis.nl/declaratiebericht573"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9441: Indien Zorgaanbiedercode voorkomt, dan mag ZorgaanbiederSpecificatie, BeroepZorgverlener of NaamZorgverlener niet voorkomen.
	IF EXIST Zorgaanbiedercode, THEN NOT EXIST  ZorgaanbiederSpecificatie OR BeroepZorgverlener OR NaamZorgverlener -->
	<xsl:template name="rc9441">
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederSpecificatie"/>
		<xsl:param name="BeroepZorgverlener"/>
		<xsl:param name="NaamZorgverlener"/>
		
		<xsl:if test="$Zorgaanbiedercode and ($ZorgaanbiederSpecificatie or $BeroepZorgverlener or $NaamZorgverlener)">
			<gds802:Feedback>
				<gds802:Retourcode>9441</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$ZorgaanbiederSpecificatie">
					<!-- <gds802:ZorgaanbiederSpecificatie> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSpecificatie)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSpecificatie"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>					
				</xsl:if>
				<xsl:if test="$BeroepZorgverlener">
					<!-- <gds802:BeroepZorgverlener> -->
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($BeroepZorgverlener)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$BeroepZorgverlener"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>					
				</xsl:if>					
				<xsl:if test="$NaamZorgverlener">
						<!-- <gds802:NaamZorgverlener> -->
						<xsl:if test="$NaamZorgverlener/gds801:Initialen">
							<gds802:BetrokkenElement>
								<gds802:Elementnaam><xsl:value-of select="local-name($NaamZorgverlener/gds801:Initialen)"/></gds802:Elementnaam>
								<gds802:Elementwaarde><xsl:value-of select="$NaamZorgverlener/gds801:Initialen"/></gds802:Elementwaarde>
							</gds802:BetrokkenElement>		
						</xsl:if>					
						<xsl:if test="$NaamZorgverlener/gds801:Geslachtsnaam">
							<!-- <gds802:Geslachtsnaam>	-->
							<xsl:if test="$NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels">
								<gds802:BetrokkenElement>
									<gds802:Elementnaam><xsl:value-of select="local-name($NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels)"/></gds802:Elementnaam>
									<gds802:Elementwaarde><xsl:value-of select="$NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels"/></gds802:Elementwaarde>
								</gds802:BetrokkenElement>
							</xsl:if>	
							<gds802:BetrokkenElement>
								<gds802:Elementnaam><xsl:value-of select="local-name($NaamZorgverlener/gds801:Geslachtsnaam/gds801:Achternaam)"/></gds802:Elementnaam>
								<gds802:Elementwaarde><xsl:value-of select="$NaamZorgverlener/gds801:Geslachtsnaam/gds801:Achternaam"/></gds802:Elementwaarde>
							</gds802:BetrokkenElement>
							<!-- </gds802:Geslachtsnaam>	-->
						</xsl:if>
						<!-- </gds802:NaamZorgverlener>	-->
				</xsl:if>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>