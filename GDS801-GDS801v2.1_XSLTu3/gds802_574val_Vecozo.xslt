<?xml version="1.0" encoding="UTF-8"?>
<!-- gds802_574val_Vecozo_v2, sept 2024 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VALXSLT controle retourbericht verzekeraar door Vecozo -->
	<xsl:import href="rc9262b.xslt"/>
	<xsl:import href="rc9263b.xslt"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="gds802:Bericht">
		<gds802:Bericht>
			<xsl:attribute name="xsi:schemaLocation">http://ei.vektis.nl/declaratiebericht574 gds802_574.xsd</xsl:attribute>
			<xsl:apply-templates select="gds802:Header"/>
			<xsl:apply-templates select="gds802:DeclaratieContext"/>
			<xsl:apply-templates select="gds802:Overzicht"/>
			<xsl:apply-templates select="gds802:Verzekerde"/>
		</gds802:Bericht>
	</xsl:template>
	<xsl:template match="gds802:Header">
		<!-- retourneer klasse Header -->
		<gds802:Header>
			<xsl:apply-templates select="gds802:Berichtcode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Berichtversie" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Berichtsubversie" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Berichtsoort" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Verzender" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:VerzenderRol" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Ontvanger" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:OntvangerRol" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Verzenddatum" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
			<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
			<!-- controles klasse Header uitvoeren -->
			<!-- VC003: Indien Berichtcode = 574 (= Retourbericht Declaratie), dan mag alleen VerzenderRol = 2 (= Servicebureau), 3 (= Zorgverzekeraar), 4 (= DJI), 5 (= Zorgkantoor) of 6 (= VECOZO) voorkomen of 7 (= CAK). -->
			<xsl:call-template name="rc9262b">
				<xsl:with-param name="Berichtcode" select="gds802:Berichtcode"/>
				<xsl:with-param name="VerzenderRol" select="gds802:VerzenderRol"/>
			</xsl:call-template>
			<!-- VC005: Indien Berichtcode = 574 (= Retourbericht Declaratie), dan mag alleen OntvangerRol = 1 (= Zorgaanbieder) of 2 (= Servicebureau) voorkomen. -->
			<xsl:call-template name="rc9263b">
				<xsl:with-param name="Berichtcode" select="gds802:Berichtcode"/>
				<xsl:with-param name="OntvangerRol" select="gds802:OntvangerRol"/>
			</xsl:call-template>
		</gds802:Header>
	</xsl:template>
	<xsl:template match="gds802:DeclaratieContext">
		<!-- klasse DeclaratieContext volledig retourneren -->
		<gds802:DeclaratieContext>
			<xsl:apply-templates select="gds802:Declarant"/>
			<xsl:apply-templates select="gds802:Zorgaanbieder"/>
			<xsl:apply-templates select="gds802:BetalingAanServicebureau" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Factuurnummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Factuurdatum" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:BtwIdentificatienummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Valutacode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:InformatiesysteemCode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:InformatiesysteemVersie" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:BegindatumDeclaratieperiode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:EinddatumDeclaratieperiode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DeclaratienummerVerzekeraar" mode="copy-if-exists"/>
			<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
			<!-- geen controles voor klasse DeclaratieContext -->
		</gds802:DeclaratieContext>
	</xsl:template>
	<xsl:template match="gds802:Declarant">
		<!-- klasse Declarant is onderdeel van DeclaratieContext, alle gegevens van type ZorgaanbiederBeperkt retourneren -->
		<gds802:Declarant>
			<xsl:apply-templates select="gds802:Zorgaanbiedercode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ZorgaanbiederSoort" mode="copy-if-exists"/>
			<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
			<!-- geen controles voor klasse Declarant -->
		</gds802:Declarant>
	</xsl:template>
	<xsl:template match="gds802:Zorgaanbieder">
		<gds802:Zorgaanbieder>
			<xsl:choose>
				<!-- bevat bovenliggende klasse Declarant dan is klasse Zorgaanbieder (card 0,1) onderdeel van DeclaratieContext, alle gegevens van type ZorgaanbiederBeperkt retourneren -->
				<xsl:when test="../gds802:Declarant">
					<xsl:apply-templates select="gds802:Zorgaanbiedercode" mode="copy-if-exists"/>
					<xsl:apply-templates select="gds802:ZorgaanbiederSoort" mode="copy-if-exists"/>
					<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
					<!-- geen controles voor klasse Zorgaanbieder -->
				</xsl:when>
			</xsl:choose>
		</gds802:Zorgaanbieder>
	</xsl:template>
	<xsl:template match="gds802:NaamZorgverlener">
		<!-- geen controles voor klasse NaamZorgverlener -->
	</xsl:template>
	<xsl:template match="gds802:Overzicht">
		<!-- klasse Overzicht volledig retourneren -->
		<gds802:Overzicht>
			<xsl:apply-templates select="gds802:TotaalDeclaratiebedragInclBtw"/>
			<xsl:apply-templates select="gds802:TotaalToegekendBedragInclBtwFinancieel"/>
			<xsl:apply-templates select="gds802:TotaalToegekendBedragInclBtwNietFinancieel"/>
			<!-- geen controles voor klasse Overzicht -->
		</gds802:Overzicht>
	</xsl:template>
	<xsl:template match="gds802:TotaalDeclaratiebedragInclBtw">
		<!-- klasse TotaalDeclaratiebedragInclBtw is onderdeel van Overzicht, alle gegevens retourneren -->
		<gds802:TotaalDeclaratiebedragInclBtw>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
			<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
			<!-- geen controles voor klasse TotaalDeclaratiebedragInclBtw -->
		</gds802:TotaalDeclaratiebedragInclBtw>
	</xsl:template>
	<xsl:template match="gds802:TotaalToegekendBedragInclBtwFinancieel">
		<!-- klasse TotaalToegekendBedragInclBtwFinancieel is onderdeel van Overzicht, alle gegevens retourneren -->
		<gds802:TotaalToegekendBedragInclBtwFinancieel>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
			<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
			<!-- geen controles voor klasse TotaalToegekendBedragInclBtwFinancieel -->
		</gds802:TotaalToegekendBedragInclBtwFinancieel>
	</xsl:template>
	<xsl:template match="gds802:TotaalToegekendBedragInclBtwNietFinancieel">
		<!-- klasse TotaalToegekendBedragInclBtwNietFinancieel is onderdeel van Overzicht, alle gegevens retourneren -->
		<gds802:TotaalToegekendBedragInclBtwNietFinancieel>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
			<!-- eventuele feedback van de verzekeraar is voor deze controle niet relevant -->
			<!-- geen controles voor klasse TotaalToegekendBedragInclBtwNietFinancieel -->
		</gds802:TotaalToegekendBedragInclBtwNietFinancieel>
	</xsl:template>
	<xsl:template match="gds802:Verzekerde">
		<gds802:Verzekerde>
			<!-- retourneer identificerende gegevens van Verzekerde -->
			<xsl:apply-templates select="gds802:BSN" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:UzoviNummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:Verzekerdennummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:PatientIdentificatienummer" mode="copy-if-exists"/>
			<!-- controles klasse Verzekerde uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds802:Prestatie"/>
		</gds802:Verzekerde>
	</xsl:template>
	<xsl:template match="gds802:Prestatie">
		<gds802:Prestatie>
			<!-- controles klasse Prestatie uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds802:DebetPrestatie"/>
			<xsl:apply-templates select="gds802:CreditPrestatie"/>
		</gds802:Prestatie>
	</xsl:template>
	<xsl:template match="gds802:DebetPrestatie">
		<gds802:DebetPrestatie>
			<!-- retourneer identificerende gegevens van DebetPrestatie -->
			<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:BerekendBedragVerzekeraarInclBtw" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ToegekendBedragInclBtwFinancieel" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ToegekendBedragInclBtwNietFinancieel" mode="copy-if-exists"/>
		</gds802:DebetPrestatie>
	</xsl:template>
	<xsl:template match="gds802:CreditPrestatie">
		<gds802:CreditPrestatie>
			<!-- retourneer identificerende gegevens van CreditPrestatie -->
			<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ToegekendCreditBedragInclBtwFinancieel" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ToegekendCreditBedragInclBtwNietFinancieel" mode="copy-if-exists"/>
		</gds802:CreditPrestatie>
	</xsl:template>
	<!-- Copy template: als een enkel element voorkomt, wordt deze gekopieerd in de opgegeven namespace -->
	<xsl:template match="*[namespace-uri()='http://ei.vektis.nl/declaratiebericht574']" mode="copy-if-exists">
		<xsl:if test=".">
			<xsl:element name="{concat('gds802:',local-name())}">
				<xsl:value-of select="text()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>