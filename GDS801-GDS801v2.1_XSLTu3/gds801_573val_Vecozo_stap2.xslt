<?xml version="1.0" encoding="UTF-8"?>
<!-- gds801_573val_Vecozo_stap2_v2.0u1, sept 2024 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cod="http://ei.vektis.nl/codelijsten/v1" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574" xmlns:gen="http://ei.vektis.nl/generiekefuncties">
	<!-- VALXSLT 2 TRAPS RETOURBERICHT  - versie Vecozo -->
	<!-- Deze xslt doet stap 2, i.e. filteren overbodige ballast met eindresultaat retourbericht -->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="//gds802:Bericht">
		<gds802:Bericht>
			<xsl:attribute name="xsi:schemaLocation">http://ei.vektis.nl/declaratiebericht574 gds802_574.xsd</xsl:attribute>
			<xsl:apply-templates select="gds802:Header"/>
			<xsl:apply-templates select="gds802:DeclaratieContext"/>
			<xsl:apply-templates select="gds802:Overzicht"/>
			<xsl:apply-templates select="gds802:Verzekerde"/>
		</gds802:Bericht>
	</xsl:template>
	<xsl:template match="gds802:Header">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
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
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
			<xsl:apply-templates select="gen:Feedback"/>
		</gds802:Header>
	</xsl:template>
	<xsl:template match="gds802:DeclaratieContext">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
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
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
			<xsl:apply-templates select="gen:Feedback"/>
		</gds802:DeclaratieContext>
	</xsl:template>
	<xsl:template match="gds802:Declarant">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:Declarant>
			<xsl:apply-templates select="gds802:Zorgaanbiedercode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ZorgaanbiederSoort" mode="copy-if-exists"/>
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
			<xsl:apply-templates select="gen:Feedback"/>
		</gds802:Declarant>
	</xsl:template>
	<xsl:template match="gds802:Zorgaanbieder">
		<xsl:choose>
			<xsl:when test="../gds802:Factuurnummer">
				<!-- het gaat hier om de klasse Zorgaanbieder uit klasse DeclaratieContext, dus volledig opnemen in retourbericht -->
				<gds802:Zorgaanbieder>
					<xsl:apply-templates select="gds802:Zorgaanbiedercode" mode="copy-if-exists"/>
					<xsl:apply-templates select="gds802:ZorgaanbiederSoort" mode="copy-if-exists"/>
					<!-- retourneer eventuele feedback -->
					<xsl:apply-templates select="gds802:Feedback"/>
					<xsl:apply-templates select="gen:Feedback"/>
				</gds802:Zorgaanbieder>
			</xsl:when>
			<xsl:otherwise>
				<!-- het gaat hier om de klasse Zorgaanbieder uit andere delen van declaratiebericht, alleen opnemen in retourbericht als sprake is van feedback -->
				<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
					<!-- fout gevonden, retourneer klasse -->
					<gds802:Zorgaanbieder>
						<!-- retourneer identificerende gegevens van Zorgaanbieder -->
						<xsl:apply-templates select="gds802:Zorgaanbiedercode" mode="copy-if-exists"/>
						<xsl:apply-templates select="gds802:ZorgaanbiederSoort" mode="copy-if-exists"/>
						<xsl:apply-templates select="gds802:ZorgaanbiederSpecificatie" mode="copy-if-exists"/>
						<xsl:if test="gds802:NaamZorgverlener">
							<gds802:NaamZorgverlener>
								<xsl:apply-templates select="gds802:NaamZorgverlener/gds802:Initialen" mode="copy-if-exists"/>
								<xsl:if test="gds802:NaamZorgverlener/gds802:Geslachtsnaam">
									<gds802:Geslachtsnaam>
										<xsl:apply-templates select="gds802:NaamZorgverlener/gds802:Geslachtsnaam/gds802:Voorvoegsels" mode="copy-if-exists"/>
										<xsl:apply-templates select="gds802:NaamZorgverlener/gds802:Geslachtsnaam/gds802:Achternaam" mode="copy-if-exists"/>
									</gds802:Geslachtsnaam>
								</xsl:if>
							</gds802:NaamZorgverlener>
						</xsl:if>
						<xsl:apply-templates select="gds802:BeroepZorgverlener" mode="copy-if-exists"/>
						<xsl:apply-templates select="gds802:ZorgaanbiederRol" mode="copy-if-exists"/>
						<xsl:apply-templates select="gds802:NaamZorgverlener"/>
						<!-- retourneer feedback -->
						<xsl:apply-templates select="gds802:Feedback"/>
						<xsl:apply-templates select="gen:Feedback"/>
					</gds802:Zorgaanbieder>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gds802:NaamZorgverlener">
		<!-- retourneer de klasse inclusief identificerende gegevens als klasse en/of subklassen één of meer fouten bevat -->
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:NaamZorgverlener>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:NaamZorgverlener>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Geslachtsnaam">
	</xsl:template>
	<xsl:template match="gds802:GeslachtsnaamPartner">
	</xsl:template>
	<xsl:template match="gds802:Overzicht">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:Overzicht>
			<xsl:apply-templates select="gds802:TotaalDeclaratiebedragInclBtw"/>
			<xsl:apply-templates select="gds802:TotaalToegekendBedragInclBtwFinancieel"/>
			<xsl:apply-templates select="gds802:TotaalToegekendBedragInclBtwNietFinancieel"/>
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
			<xsl:apply-templates select="gen:Feedback"/>
		</gds802:Overzicht>
	</xsl:template>
	<xsl:template match="gds802:TotaalDeclaratiebedragInclBtw">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:TotaalDeclaratiebedragInclBtw>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
			<xsl:apply-templates select="gen:Feedback"/>
		</gds802:TotaalDeclaratiebedragInclBtw>
	</xsl:template>
	<xsl:template match="gds802:TotaalToegekendBedragInclBtwFinancieel">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:TotaalToegekendBedragInclBtwFinancieel>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
		</gds802:TotaalToegekendBedragInclBtwFinancieel>
	</xsl:template>
	<xsl:template match="gds802:TotaalToegekendBedragInclBtwNietFinancieel">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:TotaalToegekendBedragInclBtwNietFinancieel>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
		</gds802:TotaalToegekendBedragInclBtwNietFinancieel>
	</xsl:template>
	<xsl:template match="gds802:Verzekerde">
		<!-- retourneer de klasse inclusief identificerende gegevens als klasse en/of subklassen één of meer fouten bevat -->
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Verzekerde>
				<!-- retourneer identificerende gegevens van Verzekerde -->
				<xsl:apply-templates select="gds802:BSN" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:UzoviNummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Verzekerdennummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:PatientIdentificatienummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:BuitenlandVerzekerde"/>
				<xsl:apply-templates select="gds802:AanvullendeVerzekerdegegevens"/>
				<xsl:apply-templates select="gds802:Prestatie"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Verzekerde>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:AanvullendeVerzekerdegegevens">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:AanvullendeVerzekerdegegevens>
				<xsl:apply-templates select="gds802:Naamgegevens"/>
				<xsl:apply-templates select="gds802:Adresgegevens"/>
				<xsl:apply-templates select="gds802:Debiteur"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:AanvullendeVerzekerdegegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Naamgegevens">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Naamgegevens>
				<xsl:apply-templates select="gds802:Geslachtsnaam"/>
				<xsl:apply-templates select="gds802:GeslachtsnaamPartner"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Naamgegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Geslachtsnaam">
	</xsl:template>
	<xsl:template match="gds802:GeslachtsnaamPartner">
	</xsl:template>
	<xsl:template match="gds802:Adresgegevens">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Adresgegevens>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Adresgegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Debiteur">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Debiteur>
				<xsl:apply-templates select="gds802:Naamgegevens"/>
				<xsl:apply-templates select="gds802:Adresgegevens"/>
				<xsl:apply-templates select="gds802:Contactgegevens"/>
				<xsl:apply-templates select="gds802:Bankgegevens"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Debiteur>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Contactgegevens">
	</xsl:template>
	<xsl:template match="gds802:Telefoonnummers">
	</xsl:template>
	<xsl:template match="gds802:EmailAdressen">
	</xsl:template>
	<xsl:template match="gds802:Bankgegevens">
	</xsl:template>
	<xsl:template match="gds802:Prestatie">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Prestatie>
				<xsl:apply-templates select="gds802:DebetPrestatie"/>
				<xsl:apply-templates select="gds802:CreditPrestatie"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Prestatie>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:DebetPrestatie">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:DebetPrestatie>
				<!-- retourneer identificerende gegevens van DebetPrestatie -->
				<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:AanvullendPrestatieKenmerk"/>
				<xsl:apply-templates select="gds802:Verwijzing"/>
				<xsl:apply-templates select="gds802:Zorgaanbieder"/>
				<xsl:apply-templates select="gds802:AanvullendePrestatiegegevens"/>
				<xsl:apply-templates select="gds802:BerekendBedragVerzekeraarInclBtw" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendBedragInclBtwFinancieel" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendBedragInclBtwNietFinancieel" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:DebetPrestatie>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:AanvullendPrestatieKenmerk">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:AanvullendPrestatieKenmerk>
				<!-- retourneer identificerende gegevens van AanvullendPrestatieKenmerk -->
				<xsl:apply-templates select="gds802:ApkCodelijstCode" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ApkCode" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:AanvullendPrestatieKenmerk>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Verwijzing">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Verwijzing>
				<!-- retourneer identificerende gegevens van Verwijzing -->
				<xsl:apply-templates select="gds802:TypeVerwijzingcode" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Verwijzer"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Verwijzing>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Verwijzer">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Verwijzer>
				<xsl:apply-templates select="gds802:NaamZorgverlener"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Verwijzer>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:AanvullendePrestatiegegevens">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:AanvullendePrestatiegegevens>
				<xsl:apply-templates select="gds802:Diagnose"/>
				<xsl:apply-templates select="gds802:Zorgtraject"/>
				<xsl:apply-templates select="gds802:Plaatsingsbesluit"/>
				<xsl:apply-templates select="gds802:InternationaalVerzekeringsbewijs"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:AanvullendePrestatiegegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:InternationaalVerzekeringsbewijs">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:InternationaalVerzekeringsbewijs>
				<xsl:apply-templates select="gds802:Nummer" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:InternationaalVerzekeringsbewijs>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Diagnose">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Diagnose>
				<!-- retourneer identificerende gegevens van Diagnose-->
				<xsl:apply-templates select="gds802:DiagnoseCodelijstCode" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Diagnosecode" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Diagnosesteller"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Diagnose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Diagnosesteller">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Diagnosesteller>
				<xsl:apply-templates select="gds802:NaamZorgverlener"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Diagnosesteller>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Zorgtraject">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Zorgtraject>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Zorgtraject>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Plaatsingsbesluit">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Plaatsingsbesluit>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:Plaatsingsbesluit>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:CreditPrestatie">
		<xsl:if test=".//gen:Feedback or .//gds802:Feedback">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:CreditPrestatie>
				<!-- retourneer identificerende gegevens van CreditPrestatie -->
				<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendCreditBedragInclBtwFinancieel" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendCreditBedragInclBtwNietFinancieel" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
				<xsl:apply-templates select="gen:Feedback"/>
			</gds802:CreditPrestatie>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Feedback">
		<gds802:Feedback>
			<xsl:apply-templates select="gds802:Retourcode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:BetrokkenElement"/>
		</gds802:Feedback>
	</xsl:template>
	<xsl:template match="gds802:BetrokkenElement">
		<gds802:BetrokkenElement>
			<xsl:apply-templates select="*" mode="copy-if-exists"/>
		</gds802:BetrokkenElement>
	</xsl:template>
	<xsl:template match="gen:Feedback">
		<gds802:Feedback>
			<xsl:apply-templates select="gen:Retourcode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gen:BetrokkenElement"/>
		</gds802:Feedback>
	</xsl:template>
	<xsl:template match="gen:BetrokkenElement">
		<gds802:BetrokkenElement>
			<xsl:apply-templates select="*" mode="copy-if-exists"/>
		</gds802:BetrokkenElement>
	</xsl:template>
	<!-- Copy template: als een enkel element voorkomt is, wordt deze gekopieerd in de opgegeven namespace -->
	<xsl:template match="gds802:*" mode="copy-if-exists">
		<xsl:param name="NameSpacePrefix" select="'gds802:'"/>
		<xsl:if test=".">
			<xsl:element name="{concat($NameSpacePrefix,local-name())}">
				<xsl:value-of select="text()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[namespace-uri()='http://ei.vektis.nl/generiekefuncties']" mode="copy-if-exists">
		<xsl:if test=".">
			<xsl:element name="{concat('gds802:',local-name())}">
				<xsl:value-of select="text()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>