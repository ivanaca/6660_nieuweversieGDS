<?xml version="1.0" encoding="UTF-8"?>
<!-- gds801_573val_Vecozo_stap2_v1, 14 juli 2021 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cod="http://ei.vektis.nl/codelijsten/v1" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
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
		</gds802:DeclaratieContext>
	</xsl:template>
	<xsl:template match="gds802:Declarant">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:Declarant>
			<xsl:apply-templates select="gds802:Zorgaanbiedercode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:ZorgaanbiederSoort" mode="copy-if-exists"/>
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
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
				</gds802:Zorgaanbieder>
			</xsl:when>
			<xsl:otherwise>
				<!-- het gaat hier om de klasse Zorgaanbieder uit andere delen van declaratiebericht, alleen opnemen in retourbericht als sprake is van feedback -->
				<xsl:variable name="FoutenZorgaanb" select="count(./gds802:Feedback) +
													count(./gds802:NaamZorgverlener/gds802:Feedback)"/>
				<xsl:if test="$FoutenZorgaanb &gt;0">
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
						<!-- retourneer feedback -->
						<xsl:apply-templates select="gds802:NaamZorgverlener"/>
						<xsl:apply-templates select="gds802:Feedback"/>
					</gds802:Zorgaanbieder>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gds802:NaamZorgverlener">
		<!-- retourneer de klasse inclusief identificerende gegevens als klasse en/of subklassen één of meer fouten bevat -->
		<xsl:variable name="FoutenNaamZorgverl" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenNaamZorgverl &gt;0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:NaamZorgverlener>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
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
		</gds802:Overzicht>
	</xsl:template>
	<xsl:template match="gds802:TotaalDeclaratiebedragInclBtw">
		<!-- retourneer alle gegevens van de klasse, onvoorwaardelijk voor deze klasse -->
		<gds802:TotaalDeclaratiebedragInclBtw>
			<xsl:apply-templates select="gds802:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds802:DebetCreditCode" mode="copy-if-exists"/>
			<!-- retourneer eventuele feedback -->
			<xsl:apply-templates select="gds802:Feedback"/>
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
		<xsl:variable name="FoutenVerz" select="count(./gds802:Feedback)"/>
		<xsl:variable name="FoutenBtlVerz" select="count(./gds802:BuitenlandVerzekerde/gds802:Feedback) +
											count(./gds802:BuitenlandVerzekerde/gds802:Bijlage/gds802:Feedback)"/>
		<xsl:variable name="FoutenAanvVerzGeg" select="count(./gds802:AanvullendeVerzekerdegegevens/gds802:Feedback) +
											count(./gds802:AanvullendeVerzekerdegegevens/gds802:Naamgegevens/gds802:Feedback) +
											count(./gds802:AanvullendeVerzekerdegegevens/gds802:Adresgegevens/gds802:Feedback) +
											count(./gds802:AanvullendeVerzekerdegegevens/gds802:Debiteur/gds802:Feedback) +
											count(./gds802:AanvullendeVerzekerdegegevens/gds802:Debiteur/gds802:Naamgegevens/gds802:Feedback) +
											count(./gds802:AanvullendeVerzekerdegegevens/gds802:Debiteur/gds802:Adresgegevens/gds802:Feedback)"/>
		<xsl:variable name="FoutenPrest" select="count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:Feedback) + 
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendPrestatieKenmerk/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:Verwijzing/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:Verwijzing/gds802:Verwijzer/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:Verwijzing/gds802:Verwijzer/gds802:NaamZorgverlener/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:Zorgaanbieder/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:Zorgaanbieder/gds802:NaamZorgverlener/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Diagnosesteller/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Diagnosesteller/gds802:NaamZorgverlener/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Zorgtraject/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Plaatsingsbesluit/gds802:Feedback) +
					count(./gds802:Prestatie/gds802:CreditPrestatie/gds802:Feedback)"/>
		<xsl:if test="($FoutenVerz+$FoutenBtlVerz+$FoutenAanvVerzGeg+$FoutenPrest) &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Verzekerde>
				<!-- retourneer identificerende gegevens van Verzekerde -->
				<xsl:apply-templates select="gds802:BSN" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:UzoviNummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Verzekerdennummer" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:PatientIdentificatienummer" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:BuitenlandVerzekerde"/>
				<xsl:apply-templates select="gds802:AanvullendeVerzekerdegegevens"/>
				<xsl:apply-templates select="gds802:Prestatie"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Verzekerde>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:BuitenlandVerzekerde">
		<xsl:variable name="FoutenBtlVerz" select="count(./gds802:Feedback)"/>
		<xsl:if test="($FoutenBtlVerz) &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:BuitenlandVerzekerde>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Bijlage"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:BuitenlandVerzekerde>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Bijlage">
	</xsl:template>
	<xsl:template match="gds802:AanvullendeVerzekerdegegevens">
		<xsl:variable name="FoutenAanvVerzGeg" select="count(./gds802:Feedback) +
																					count(./gds802:Naamgegevens/gds802:Feedback) +
																					count(./gds802:Adresgegevens/gds802:Feedback) +
																					count(./gds802:Debiteur/gds802:Feedback) +
																					count(./gds802:Debiteur/gds802:Naamgegevens/gds802:Feedback) +
																					count(./gds802:Debiteur/gds802:Adresgegevens/gds802:Feedback)"/>
		<xsl:if test="($FoutenAanvVerzGeg) &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:AanvullendeVerzekerdegegevens>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Naamgegevens"/>
				<xsl:apply-templates select="gds802:Adresgegevens"/>
				<xsl:apply-templates select="gds802:Debiteur"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:AanvullendeVerzekerdegegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Naamgegevens">
		<xsl:variable name="FoutenNaamGeg" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenNaamGeg &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Naamgegevens>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Geslachtsnaam"/>
				<xsl:apply-templates select="gds802:GeslachtsnaamPartner"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Naamgegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Geslachtsnaam">
	</xsl:template>
	<xsl:template match="gds802:GeslachtsnaamPartner">
	</xsl:template>
	<xsl:template match="gds802:Adresgegevens">
		<xsl:variable name="FoutenAdresGeg" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenAdresGeg &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Adresgegevens>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Adresgegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Debiteur">
		<xsl:variable name="FoutenDeb" select="count(./gds802:Feedback) +
										count(./gds802:Naamgegevens/gds802:Feedback) +
										count(./gds802:Adresgegevens/gds802:Feedback)"/>
		<xsl:if test="($FoutenDeb) &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Debiteur>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Naamgegevens"/>
				<xsl:apply-templates select="gds802:Adresgegevens"/>
				<xsl:apply-templates select="gds802:Contactgegevens"/>
				<xsl:apply-templates select="gds802:Bankgegevens"/>
				<xsl:apply-templates select="gds802:Feedback"/>
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
		<xsl:variable name="FoutenDebetPrest" select="count(./gds802:DebetPrestatie/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendPrestatieKenmerk/gds802:Feedback) + 
			count(./gds802:DebetPrestatie/gds802:Verwijzing/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:Verwijzing/gds802:Verwijzer/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:Verwijzing/gds802:Verwijzer/gds802:NaamZorgverlener/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:Zorgaanbieder/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:Zorgaanbieder/gds802:NaamZorgverlener/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Diagnosesteller/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Diagnosesteller/gds802:NaamZorgverlener/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Zorgtraject/gds802:Feedback) +
			count(./gds802:DebetPrestatie/gds802:AanvullendePrestatiegegevens/gds802:Plaatsingsbesluit/gds802:Feedback)"/>
		<xsl:variable name="FoutenCreditPrest" select="count(./gds802:CreditPrestatie/gds802:Feedback)"/>
		<xsl:if test="($FoutenDebetPrest + $FoutenCreditPrest) &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Prestatie>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:DebetPrestatie"/>
				<xsl:apply-templates select="gds802:CreditPrestatie"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Prestatie>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:DebetPrestatie">
		<xsl:variable name="FoutenDebetPrest" select="count(./gds802:Feedback)"/>
		<xsl:variable name="FoutenAanvPrestKenm" select="count(./gds802:AanvullendPrestatieKenmerk/gds802:Feedback)"/>
		<xsl:variable name="FoutenVerw" select="count(./gds802:Verwijzing/gds802:Feedback) +
										count(./gds802:Verwijzing/gds802:Verwijzer/gds802:Feedback) +
										count(./gds802:Verwijzing/gds802:Verwijzer/gds802:NaamZorgverlener/gds802:Feedback)"/>
		<xsl:variable name="FoutenZorgaanb" select="count(./gds802:Zorgaanbieder/gds802:Feedback) +
										count(./gds802:Zorgaanbieder/gds802:NaamZorgverlener/gds802:Feedback)"/>
		<xsl:variable name="AanvPrestgeg" select="count(./gds802:AanvullendePrestatiegegevens/gds802:Feedback) +
										count(./gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Feedback) +
										count(./gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Diagnosesteller/gds802:Feedback) +
										count(./gds802:AanvullendePrestatiegegevens/gds802:Diagnose/gds802:Diagnosesteller/gds802:NaamZorgverlener/gds802:Feedback) +
										count(./gds802:AanvullendePrestatiegegevens/gds802:Zorgtraject/gds802:Feedback) +
										count(./gds802:AanvullendePrestatiegegevens/gds802:Plaatsingsbesluit/gds802:Feedback)"/>
		<xsl:if test="($FoutenDebetPrest+$FoutenAanvPrestKenm+$FoutenVerw+$AanvPrestgeg+$FoutenZorgaanb) &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:DebetPrestatie>
				<!-- retourneer identificerende gegevens van DebetPrestatie -->
				<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:AanvullendPrestatieKenmerk"/>
				<xsl:apply-templates select="gds802:Verwijzing"/>
				<xsl:apply-templates select="gds802:Zorgaanbieder"/>
				<xsl:apply-templates select="gds802:AanvullendePrestatiegegevens"/>
				<xsl:apply-templates select="gds802:BerekendBedragVerzekeraarInclBtw" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendBedragInclBtwFinancieel" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendBedragInclBtwNietFinancieel" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:DebetPrestatie>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:AanvullendPrestatieKenmerk">
		<xsl:variable name="FoutenAPK" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenAPK &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:AanvullendPrestatieKenmerk>
				<!-- retourneer identificerende gegevens van AanvullendPrestatieKenmerk -->
				<xsl:apply-templates select="gds802:ApkCodelijstCode" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ApkCode" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:AanvullendPrestatieKenmerk>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Verwijzing">
		<xsl:variable name="FoutenVerw" select="count(./gds802:Feedback) +
											count(./gds802:Verwijzer/gds802:Feedback) +
											count(./gds802:Verwijzer/gds802:NaamZorgverlener/gds802:Feedback)"/>
		<xsl:if test="$FoutenVerw &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Verwijzing>
				<!-- retourneer identificerende gegevens van Verwijzing -->
				<xsl:apply-templates select="gds802:TypeVerwijzingcode" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Verwijzer"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Verwijzing>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Verwijzer">
		<xsl:variable name="FoutenVerw" select="count(./gds802:Feedback) +
											count(./gds802:NaamZorgverlener/gds802:Feedback)"/>
		<xsl:if test="$FoutenVerw &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Verwijzer>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:NaamZorgverlener"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Verwijzer>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:AanvullendePrestatiegegevens">
		<xsl:variable name="FoutenAanvPrestgeg" select="count(./gds802:Feedback) +
													count(./gds802:Diagnose/gds802:Feedback) +
													count(./gds802:Diagnose/gds802:Diagnosesteller/gds802:Feedback) +
													count(./gds802:Diagnose/gds802:Diagnosesteller/gds802:NaamZorgverlener/gds802:Feedback) +
													count(./gds802:Zorgtraject/gds802:Feedback) +
													count(./gds802:Plaatsingsbesluit/gds802:Feedback)"/>
		<xsl:if test="$FoutenAanvPrestgeg &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:AanvullendePrestatiegegevens>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Diagnose"/>
				<xsl:apply-templates select="gds802:Zorgtraject"/>
				<xsl:apply-templates select="gds802:Plaatsingsbesluit"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:AanvullendePrestatiegegevens>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Diagnose">
		<xsl:variable name="FoutenDiagn" select="count(./gds802:Feedback) +
													count(./gds802:Diagnosesteller/gds802:Feedback) +
													count(./gds802:Diagnosesteller/gds802:NaamZorgverlener/gds802:Feedback)"/>
		<xsl:if test="$FoutenDiagn &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Diagnose>
				<!-- retourneer identificerende gegevens van Diagnose-->
				<xsl:apply-templates select="gds802:DiagnoseCodelijstCode" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Diagnosecode" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Diagnosesteller"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Diagnose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Diagnosesteller">
		<xsl:variable name="FoutenDiagnSteller" select="count(./gds802:Feedback) +
													count(./gds802:NaamZorgverlener/gds802:Feedback)"/>
		<xsl:if test="$FoutenDiagnSteller &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Diagnosesteller>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:NaamZorgverlener"/>
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Diagnosesteller>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Zorgtraject">
		<xsl:variable name="FoutenZorgTraj" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenZorgTraj &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Zorgtraject>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Zorgtraject>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:Plaatsingsbesluit">
		<xsl:variable name="FoutenPlBesl" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenPlBesl &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:Plaatsingsbesluit>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:Feedback"/>
			</gds802:Plaatsingsbesluit>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gds802:CreditPrestatie">
		<xsl:variable name="FoutenCreditPrest" select="count(./gds802:Feedback)"/>
		<xsl:if test="$FoutenCreditPrest &gt; 0">
			<!-- fout gevonden, retourneer klasse -->
			<gds802:CreditPrestatie>
				<!-- retourneer identificerende gegevens van CreditPrestatie -->
				<xsl:apply-templates select="gds802:Referentienummer" mode="copy-if-exists"/>
				<!-- retourneer feedback -->
				<xsl:apply-templates select="gds802:ToegekendCreditBedragInclBtwFinancieel" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:ToegekendCreditBedragInclBtwNietFinancieel" mode="copy-if-exists"/>
				<xsl:apply-templates select="gds802:Feedback"/>
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
	<!-- Copy template: als een enkel element voorkomt is, wordt deze gekopieerd in de opgegeven namespace -->
	<xsl:template match="gds802:*" mode="copy-if-exists">
		<xsl:param name="NameSpacePrefix" select="'gds802:'"/>
		<xsl:if test=".">
			<xsl:element name="{concat($NameSpacePrefix,local-name())}">
				<xsl:value-of select="text()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[not(starts-with(name(), 'gds802:'))]" mode="copy-if-exists">
		<xsl:if test=".">
			<xsl:element name="{name()}">
				<xsl:value-of select="text()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
