<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9452.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9452: Indien BeroepZorgverlener voorkomt, dan moet ZorgaanbiederRol = 01 (= Behandelaar) of 03 (= Verwijzer). -->
	<xsl:template name="rc9452">
		<xsl:param name="BeroepZorgverlener"/>
		<xsl:param name="ZorgaanbiederRol"/>
		
		<xsl:if test="$BeroepZorgverlener and not($ZorgaanbiederRol='01' or $ZorgaanbiederRol='03')">
			<gds802:Feedback>
				<gds802:Retourcode>9452</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BeroepZorgverlener)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BeroepZorgverlener"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederRol)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederRol"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>				
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
