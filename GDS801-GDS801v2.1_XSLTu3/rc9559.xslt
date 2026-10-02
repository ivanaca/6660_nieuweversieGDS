<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9559.xslt, juli 2026 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9559: Indien PrestatieCodelijstCode = 073 (= Fysiotherapie) of 074 (= Oefentherapie) of 075 (= Huidtherapie) of 076(= Diëtetiek) of 077 (= Ergotherapie) of 078 (= Logopedie) of 079 (= GLI) of 080 (= Podotherapie) , of 081 (=Prestatiecodelijst Overig GDS)dan moet Zorgaanbiedercode, ZorgaanbiederSoort = 3 (= Zorgverlener) en ZorgaanbiederRol = 01 (= Behandelaar) voorkomen. -->
	<xsl:template name="rc9559">
		<xsl:param name="PrestatieCodelijstCode"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederRol"/>
		<xsl:param name="ZorgaanbiederSoort"/>
		
		<xsl:if test="(($PrestatieCodelijstCode='073' or $PrestatieCodelijstCode='074' or $PrestatieCodelijstCode='075' or $PrestatieCodelijstCode='076' or $PrestatieCodelijstCode='077' or $PrestatieCodelijstCode='078' or $PrestatieCodelijstCode='079' or $PrestatieCodelijstCode='080' or $PrestatieCodelijstCode='081') and not($Zorgaanbiedercode and $ZorgaanbiederRol='01' and $ZorgaanbiederSoort='3'))">
			<gds802:Feedback>
				<gds802:Retourcode>9559</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($PrestatieCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$PrestatieCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<xsl:if test="$Zorgaanbiedercode">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($Zorgaanbiedercode)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$Zorgaanbiedercode"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
				<xsl:if test="$ZorgaanbiederRol">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederRol)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederRol"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
				<xsl:if test="$ZorgaanbiederSoort">
					<gds802:BetrokkenElement>
						<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederSoort)"/></gds802:Elementnaam>
						<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederSoort"/></gds802:Elementwaarde>
					</gds802:BetrokkenElement>
				</xsl:if>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>