<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9556.xslt, u1 15 augustus 2023 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9556: Indien ApkCodelijstCode = 003 (= Overige prestatie-indicatie) en ApkCode = 01 (= Betreft prestatie in het kader van GZSP behandelplan), dan moet Zorgaanbieder/Zorgaanbiedercode, Zorgaanbieder/ZorgaanbiederRol = 02 (= Regiebehandelaar) en Zorgaanbieder/ZorgaanbiederSoort = 3 (= Zorgverlener) voorkomen. -->
	<xsl:template name="rc9556">
		<xsl:param name="ApkCodelijstCode"/>
		<xsl:param name="ApkCode"/>
		<xsl:param name="Zorgaanbiedercode"/>
		<xsl:param name="ZorgaanbiederRol"/>
		<xsl:param name="ZorgaanbiederSoort"/>
		
		<xsl:if test="($ApkCodelijstCode='003' and $ApkCode='01' and not($Zorgaanbiedercode and $ZorgaanbiederRol='02' and $ZorgaanbiederSoort='3'))">
			<gds802:Feedback>
				<gds802:Retourcode>9556</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ApkCodelijstCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ApkCodelijstCode"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ApkCode)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ApkCode"/></gds802:Elementwaarde>
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
