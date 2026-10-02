<?xml version="1.0" encoding="UTF-8"?>
<!-- gds801_573val_Vecozo_stap1_u18, augustus 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cod="http://ei.vektis.nl/codelijsten/v1" xmlns:gds801="http://ei.vektis.nl/declaratiebericht573" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VALXSLT 2 TRAPS RETOURBERICHT  - versie Vecozo -->
	<!-- Deze xslt doet stap 1, i.e. tussenresultaat retourbericht met alle klassen, identificerende gegevens van klassen en geconstateerde fouten -->
	<!-- Laden Configuratiefile met waarde voor Omgeving en Huidige datum	-->
	<xsl:import href="config_Vecozo.xml"/>
	<xsl:import href="rcCode_vs_Peildatum.xslt"/>
	<xsl:import href="rcDatum_vs_Peildatum.xslt"/>
	<xsl:import href="rcDatum_vs_IngangsdatumGDS.xslt"/>
	<xsl:import href="rcDatum_vs_Huidigedatum.xslt"/>
	<xsl:import href="rc0150.xslt"/>
	<xsl:import href="rc0435.xslt"/>
	<xsl:import href="rc8028.xslt"/>
	<xsl:import href="rc8049.xslt"/>
	<xsl:import href="rc8062.xslt"/>		
	<xsl:import href="rc8101.xslt"/>
	<xsl:import href="rc8151.xslt"/>
	<xsl:import href="rc8166a.xslt"/>
	<xsl:import href="rc8166b.xslt"/>
	<xsl:import href="rc8179.xslt"/>
	<xsl:import href="rc9262a.xslt"/>
	<xsl:import href="rc9263a.xslt"/>
	<xsl:import href="rc9264.xslt"/>
	<xsl:import href="rc9266a.xslt"/>
	<xsl:import href="rc9266b.xslt"/>
	<xsl:import href="rc9268.xslt"/>
	<xsl:import href="rc9269.xslt"/>
	<xsl:import href="rc9271.xslt"/>
	<xsl:import href="rc9272.xslt"/>
	<xsl:import href="rc9273.xslt"/>
	<xsl:import href="rc9274.xslt"/>
	<xsl:import href="rc9276.xslt"/>
	<xsl:import href="rc9278a.xslt"/>
	<xsl:import href="rc9278b.xslt"/>
	<xsl:import href="rc9279.xslt"/>
	<xsl:import href="rc9281.xslt"/>
	<xsl:import href="rc9282.xslt"/>
	<xsl:import href="rc9284.xslt"/>
	<xsl:import href="rc9286.xslt"/>
	<xsl:import href="rc9287a.xslt"/>
	<xsl:import href="rc9287b.xslt"/>
	<xsl:import href="rc9288a.xslt"/>
	<xsl:import href="rc9288b.xslt"/>
	<xsl:import href="rc9291.xslt"/>
	<xsl:import href="rc9292a.xslt"/>
	<xsl:import href="rc9292b.xslt"/>
	<xsl:import href="rc9294.xslt"/>
	<xsl:import href="rc9416.xslt"/>
	<xsl:import href="rc9417.xslt"/>
	<xsl:import href="rc9418.xslt"/>
	<xsl:import href="rc9419.xslt"/>
	<xsl:import href="rc9420.xslt"/>
	<xsl:import href="rc9421.xslt"/>
	<xsl:import href="rc9422.xslt"/>
	<xsl:import href="rc9423.xslt"/>
	<xsl:import href="rc9424.xslt"/>
	<xsl:import href="rc9425.xslt"/>
	<xsl:import href="rc9439.xslt"/>
	<xsl:import href="rc9440.xslt"/>
	<xsl:import href="rc9441.xslt"/>
	<xsl:import href="rc9442.xslt"/>
	<xsl:import href="rc9443a.xslt"/>
	<xsl:import href="rc9444a.xslt"/>
	<xsl:import href="rc9443b.xslt"/>
	<xsl:import href="rc9444b.xslt"/>
	<xsl:import href="rc9447.xslt"/>
	<xsl:import href="rc9448.xslt"/>
	<xsl:import href="rc9449.xslt"/>
	<xsl:import href="rc9450.xslt"/>
	<xsl:import href="rc9451.xslt"/>
	<xsl:import href="rc9452.xslt"/>
	<xsl:import href="rc9453.xslt"/>
	<xsl:import href="rc9454.xslt"/>
	<xsl:import href="rc9455.xslt"/>
	<xsl:import href="rc9456.xslt"/>
	<xsl:import href="rc9457.xslt"/>
	<xsl:import href="rc9465.xslt"/>
	<xsl:import href="rc9472.xslt"/>
	<xsl:import href="rc9473.xslt"/>
	<xsl:import href="rc9474.xslt"/>	
	<xsl:import href="rc9475.xslt"/>
	<xsl:import href="rc9478.xslt"/>
	<xsl:import href="rc9479.xslt"/>
	<xsl:import href="rc9481.xslt"/>
	<xsl:import href="rc9482.xslt"/>
	<xsl:import href="rc9483.xslt"/>
	<xsl:import href="rc9484.xslt"/>
	<xsl:import href="rc9485.xslt"/>
	<xsl:import href="rc9506.xslt"/>
	<xsl:import href="rc9544.xslt"/>
	<xsl:import href="rc9568.xslt"/>
	<xsl:import href="rc9797.xslt"/>
	<xsl:import href="rc9798.xslt"/>
	<xsl:import href="rc9799.xslt"/>
		
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:variable name="Berichtcode" select="//gds801:Bericht/gds801:Header/gds801:Berichtcode"/>
	<xsl:variable name="Berichtsoort" select="//gds801:Bericht/gds801:Header/gds801:Berichtsoort"/>
	<xsl:variable name="VerzenderRol" select="//gds801:Bericht/gds801:Header/gds801:VerzenderRol"/>
	<xsl:variable name="Ontvanger" select="//gds801:Bericht/gds801:Header/gds801:Ontvanger"/> 
	<xsl:variable name="OntvangerRol" select="//gds801:Bericht/gds801:Header/gds801:OntvangerRol"/> 
	<xsl:variable name="Verzenddatum" select="//gds801:Bericht/gds801:Header/gds801:Verzenddatum"/>	
	<xsl:variable name="BetalingAanServicebureau" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:BetalingAanServicebureau"/>
	<xsl:variable name="Factuurnummer" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:Factuurnummer"/>
	<xsl:variable name="Factuurdatum" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:Factuurdatum"/>
	<xsl:variable name="InformatiesysteemCode" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:InformatiesysteemCode"/>
	<xsl:variable name="InformatiesysteemVersie" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:InformatiesysteemVersie"/>
	<xsl:variable name="BegindatumDeclaratieperiode" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:BegindatumDeclaratieperiode"/>
	<xsl:variable name="EinddatumDeclaratieperiode" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:EinddatumDeclaratieperiode"/>
	<xsl:variable name="DeclarantZorgaanbiederSoort" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:Declarant/gds801:ZorgaanbiederSoort"/>
	<xsl:variable name="ZorgaanbiederZorgaanbiederSoort" select="//gds801:Bericht/gds801:DeclaratieContext/gds801:Zorgaanbieder/gds801:ZorgaanbiederSoort"/>
	<xsl:variable name="TotaalDeclaratiebedragInclBtw" select="//gds801:Bericht/gds801:Overzicht/gds801:TotaalDeclaratiebedragInclBtw/gds801:Bedrag"/>
	<xsl:variable name="TotaalDeclaratiebedragDCIndicator" select="//gds801:Bericht/gds801:Overzicht/gds801:TotaalDeclaratiebedragInclBtw/gds801:DebetCreditCode"/>
	
	<xsl:key name="DebetReferentienummer" match="//gds801:Bericht/gds801:Verzekerde/gds801:Prestatie/gds801:DebetPrestatie" use="gds801:Referentienummer"/>
	<!-- Key DebetReferentienummer om te bepalen of een credit samen met de gerelateerde debet in hetzelfde bericht zit -->
	
	<!-- Controleer op fouten in de Header -->
	<!-- RC003: VerzenderRol moet voorkomen in ketenpartij codelijst. | Indien VerzenderRol in ketenpartij voorkomt, dan moet de waarde van Verzenddatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum ketenpartij van VerzenderRol. | Indien expiratiedatum ketenpartij gevuld is, dan moet de waarde van Verzenddatum kleiner zijn dan de waarde van expiratiedatum ketenpartij van VerzenderRol. -->
	<xsl:variable name="rc003">
		<xsl:call-template name="rcCode_vs_Peildatum">
			<xsl:with-param name="Codelijst" select="'codelijsten/CL0002-VEKT.xml'"/>
			<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9302'"/>
			<xsl:with-param name="RetourcodeIngangsdatum" select="'9303'"/>
			<xsl:with-param name="RetourcodeExpiratiedatum" select="'9304'"/>
			<xsl:with-param name="Code" select="$VerzenderRol"/>
			<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- RC006: OntvangerRol moet voorkomen in ketenpartij codelijst. | Indien OntvangerRol in ketenpartij voorkomt, dan moet de waarde van Verzenddatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum ketenpartij van OntvangerRol. | Indien expiratiedatum ketenpartij gevuld is, dan moet de waarde van Verzenddatum kleiner zijn dan de waarde van expiratiedatum ketenpartij van OntvangerRol. -->
	<xsl:variable name="rc006">
		<xsl:call-template name="rcCode_vs_Peildatum">
			<xsl:with-param name="Codelijst" select="'codelijsten/CL0002-VEKT.xml'"/>
			<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9311'"/>
			<xsl:with-param name="RetourcodeIngangsdatum" select="'9312'"/>
			<xsl:with-param name="RetourcodeExpiratiedatum" select="'9313'"/>
			<xsl:with-param name="Code" select="$OntvangerRol"/>
			<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC001: De waarde van BerichtSoort moet voldoen aan de omgeving van VECOZO (productie of test) -->
	<xsl:variable name="vc001">
		<xsl:call-template name="rc8028">
			<xsl:with-param name="Berichtsoort" select="$Berichtsoort"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC002: Indien Berichtcode = 573 (= Declaratie), dan mag alleen VerzenderRol = 1 (= Zorgaanbieder) of 2 (= Servicebureau) voorkomen. -->
	<xsl:variable name="vc002">
		<xsl:call-template name="rc9262a">
			<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
			<xsl:with-param name="VerzenderRol" select="$VerzenderRol"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC004: Indien Berichtcode = 573 (= Declaratie), dan mag alleen OntvangerRol = 2 (= Servicebureau), 3 (= Zorgverzekeraar), 4 (= DJI) of 5 (= Zorgkantoor) voorkomen. -->
	<xsl:variable name="vc004">
		<xsl:call-template name="rc9263a">
			<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
			<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC006: De waarde van Verzenddatum moet kleiner zijn dan of gelijk zijn aan de waarde van huidige datum. -->
	<xsl:variable name="vc006">
		<xsl:call-template name="rcDatum_vs_Huidigedatum">
			<xsl:with-param name="TeControlerenDatum" select="$Verzenddatum"/>
			<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
			<xsl:with-param name="Retourcode" select="'8986'"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- Zet variabele als er geen fouten zijn opgetreden in de Header -->
	<xsl:variable name="FoutInHeader">
		<xsl:if test="$rc003='' and $rc006='' and $vc001='' and $vc002='' and $vc004='' and $vc006=''">false</xsl:if>
	</xsl:variable>
	
	<!-- Controleer op fouten in de DeclaratieContext -->
	<!-- VC007: Indien Berichtcode = 573 (= Declaratie) en BetalingAanServicebureau = 1 (= Ja), dan moet VerzenderRol = 2 (= Servicebureau) voorkomen. -->
	<xsl:variable name="vc007">
		<xsl:call-template name="rc9264">
			<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
			<xsl:with-param name="BetalingAanServicebureau" select="$BetalingAanServicebureau"/>
			<xsl:with-param name="VerzenderRol" select="$VerzenderRol"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC008: De waarde van Factuurdatum moet kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
	<xsl:variable name="vc008">
		<xsl:call-template name="rcDatum_vs_Peildatum">
			<xsl:with-param name="TeControlerenDatum" select="$Factuurdatum"/>
			<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
			<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
			<xsl:with-param name="Retourcode" select="'9265'"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC009: Indien InformatiesysteemCode voorkomt, dan moet ook InformatiesysteemVersie voorkomen. -->
	<xsl:variable name="vc009">
		<xsl:call-template name="rc8166a">
			<xsl:with-param name="InformatiesysteemCode" select="$InformatiesysteemCode"/>
			<xsl:with-param name="InformatiesysteemVersie" select="$InformatiesysteemVersie"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC010: Indien InformatiesysteemCode niet voorkomt, dan mag InformatiesysteemVersie niet voorkomen. -->
	<xsl:variable name="vc010">
		<xsl:call-template name="rc8166b">
			<xsl:with-param name="InformatiesysteemCode" select="$InformatiesysteemCode"/>
			<xsl:with-param name="InformatiesysteemVersie" select="$InformatiesysteemVersie"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC012: Indien BegindatumDeclaratieperiode voorkomt, dan moet EinddatumDeclaratieperiode voorkomen. -->
	<xsl:variable name="vc012">
		<xsl:call-template name="rc9266a">
			<xsl:with-param name="BegindatumDeclaratieperiode" select="$BegindatumDeclaratieperiode"/>
			<xsl:with-param name="EinddatumDeclaratieperiode" select="$EinddatumDeclaratieperiode"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC013: Indien BegindatumDeclaratieperiode niet voorkomt, dan mag EinddatumDeclaratieperiode niet voorkomen. -->
	<xsl:variable name="vc013">
		<xsl:call-template name="rc9266b">
			<xsl:with-param name="BegindatumDeclaratieperiode" select="$BegindatumDeclaratieperiode"/>
			<xsl:with-param name="EinddatumDeclaratieperiode" select="$EinddatumDeclaratieperiode"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC014: Indien EinddatumDeclaratieperiode voorkomt, dan moet de waarde van EinddatumDeclaratieperiode kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
	<xsl:variable name="vc014">
		<xsl:call-template name="rcDatum_vs_Peildatum">
			<xsl:with-param name="TeControlerenDatum" select="$EinddatumDeclaratieperiode"/>
			<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
			<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
			<xsl:with-param name="Retourcode" select="'9267'"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VC015: Indien BegindatumDeclaratieperiode voorkomt, dan moet de waarde van BegindatumDeclaratieperiode kleiner zijn dan of gelijk zijn aan de waarde van EinddatumDeclaratieperiode. -->
	<xsl:variable name="vc015">
		<xsl:if test="(($BegindatumDeclaratieperiode != '') and ($EinddatumDeclaratieperiode != ''))">
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="$BegindatumDeclaratieperiode"/>
				<xsl:with-param name="Peildatum" select="$EinddatumDeclaratieperiode"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'8175'"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:variable>
	<!-- VC098: Indien Berichtsoort = P (= Produktie) en BegindatumDeclaratieperiode voorkomt, dan moet de waarde van BegindatumDeclaratieperiode groter zijn dan of gelijk zijn aan ’01-01-2022’. -->
	<xsl:variable name="vc098">
		<xsl:if test="(($Berichtsoort = 'P') and ($BegindatumDeclaratieperiode != ''))">
			<xsl:call-template name="rcDatum_vs_IngangsdatumGDS">
				<xsl:with-param name="TeControlerenDatum" select="$BegindatumDeclaratieperiode"/>
				<xsl:with-param name="Peildatum" select="$IngangsdatumGDS"/>
				<xsl:with-param name="Vergelijking" select="'groterofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'0020'"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:variable>
	<!-- VC111: Indien Zorgaanbieder voorkomt, dan mag alleen Declarant/ZorgaanbiederSoort = 3 (= Zorgverlener) en Zorgaanbieder/ZorgaanbiederSoort = 1 (= Instelling) of 2 (= Praktijk) voorkomen (RFC-S22001). -->
	<xsl:variable name="vc111">
		<xsl:call-template name="rc9506">
			<xsl:with-param name="DeclarantZorgaanbiedersoort" select="$DeclarantZorgaanbiederSoort"/>
			<xsl:with-param name="ZorgaanbiederZorgaanbiedersoort" select="$ZorgaanbiederZorgaanbiederSoort"/>
		</xsl:call-template>
	</xsl:variable>
		<!-- VC171: Indien Factuurdatum groter dan of gelijk aan 1-1-2026, dan moet Factuurnummer voldoen aan de SEPA waarden.(RFC-S25019). -->
	<xsl:variable name="vc171">
		<xsl:call-template name="rc9797">
			<xsl:with-param name="Factuurnummer" select="$Factuurnummer"/>
			<xsl:with-param name="Factuurdatum" select="$Factuurdatum"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- RC052: Indien InformatiesysteemCode voorkomt, dan moet InformatiesysteemCode voorkomen in informatiesysteemcode codelijst. | Indien InformatiesysteemCode voorkomt en InformatiesysteemCode in informatiesysteem codelijst voorkomt, dan moet de waarde van Factuurdatum groter zijn dan of gelijk zijn aan de ingangsdatum informatiesysteemcode van InformatiesysteemCode. | Indien informatiesysteemCode voorkomt en expiratiedatum informatiesysteemcode gevuld is, dan moet de waarde van Factuurdatum kleiner zijn dan de waarde van expiratiedatum code informatiesysteem softwareleverancier van InformatiesysteemCode. -->
	<xsl:variable name="rc052">
		<xsl:call-template name="rcCode_vs_Peildatum">
			<xsl:with-param name="Codelijst" select="'codelijsten/COD805-VEKT.xml'"/>
			<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9323'"/>
			<xsl:with-param name="RetourcodeIngangsdatum" select="'9324'"/>
			<xsl:with-param name="RetourcodeExpiratiedatum" select="'9325'"/>
			<xsl:with-param name="Code" select="$InformatiesysteemCode"/>
			<xsl:with-param name="Peildatum" select="$Factuurdatum"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- controles klasse Declarant uitvoeren -->
	<!-- RC008: Declarant/ZorgaanbiederSoort moet voorkomen in zorgaanbiedersoort codelijst. -->
	<xsl:variable name="rc008">
		<xsl:call-template name="rcCode_vs_Peildatum">
			<xsl:with-param name="Codelijst" select="'codelijsten/CL0015-VEKT.xml'"/>
			<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9317'"/>
			<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
			<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
			<xsl:with-param name="Code" select="$DeclarantZorgaanbiederSoort"/>
			<xsl:with-param name="Peildatum" select="geenpeildatum"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- controles klasse Zorgaanbieder uitvoeren, in de DeclaratieContext zijn er geen subklasses -->
	<!-- RC010: Zorgaanbieder/ZorgaanbiederSoort moet voorkomen in zorgaanbiedersoort codelijst. -->
	<xsl:variable name="rc010">
		<xsl:call-template name="rcCode_vs_Peildatum">
			<xsl:with-param name="Codelijst" select="'codelijsten/CL0015-VEKT.xml'"/>
			<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9321'"/>
			<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
			<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
			<xsl:with-param name="Code" select="$ZorgaanbiederZorgaanbiederSoort"/>
			<xsl:with-param name="Peildatum" select="geenpeildatum"/>
		</xsl:call-template>
	</xsl:variable>	
	<!-- Zet variabele als er geen fouten zijn opgetreden in de DeclaratieContext of onderliggende klassen (Declarant en Zorgaanbieder) -->
	<xsl:variable name="FoutInDeclaratieContext">
		<xsl:if test="$vc007='' and $vc008='' and $vc009='' and $vc010='' and $vc012='' and $vc013='' and $vc014='' and $vc015='' and $vc098='' and $vc111='' and $vc171='' and $rc052='' and $rc008='' and $rc010=''">false</xsl:if>
	</xsl:variable>

	<!-- controles klasse Overzicht uitvoeren -->
	<!-- VC016: De waarde van TotaalDeclaratieBedragInclBtw, rekening houdend met debet/credit, moet gelijk zijn aan de som van de waarden van DeclaratiebedragInclBtw, rekening houdend met DebetCredit, van alle Prestaties.  -->
	<xsl:variable name="vc016">
		<xsl:call-template name="rc0150">
			<xsl:with-param name="TotaalDeclaratiebedragInclBtw" select="$TotaalDeclaratiebedragInclBtw"/>
			<xsl:with-param name="TotaalDeclaratiebedragDCIndicator" select="$TotaalDeclaratiebedragDCIndicator"/>
			<xsl:with-param name="TotaalDebetPrestaties" select="sum(//gds801:Bericht/gds801:Verzekerde/gds801:Prestatie/gds801:DebetPrestatie/gds801:DeclaratieBedragInclBtw)"/>
			<xsl:with-param name="TotaalCreditPrestaties" select="sum(//gds801:Bericht/gds801:Verzekerde/gds801:Prestatie/gds801:CreditPrestatie/gds801:ToegekendBedragInclBtwFinancieel)"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- controles klasse TotaalDeclaratiebedragInclBtw uitvoeren -->
	<!-- RC046: DebetCreditCode moet voorkomen in Indicatie debet/credit. -->
	<xsl:variable name="rc046">
		<xsl:call-template name="rcCode_vs_Peildatum">
			<xsl:with-param name="Codelijst" select="'codelijsten/COD043-VEKT.xml'"/>
			<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9406'"/>
			<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
			<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
			<xsl:with-param name="Code" select="$TotaalDeclaratiebedragDCIndicator"/>
			<xsl:with-param name="Peildatum" select="geenpeildatum"/>
		</xsl:call-template>
	</xsl:variable>	
	<!-- Zet variabele als er geen fouten zijn opgetreden in het Overzicht of onderliggende klassen (TotaalDeclaratiebedragInclBtw) -->
	<xsl:variable name="FoutInOverzicht">
		<xsl:if test="$vc016='' and $rc046=''">false</xsl:if>
	</xsl:variable>

	<xsl:template match="gds801:Bericht">
		<gds802:Bericht>
			<xsl:attribute name="xsi:schemaLocation">http://ei.vektis.nl/declaratiebericht574 gds802_574.xsd</xsl:attribute>
			<xsl:choose>
				<!-- Geen errors in de Header, DeclaratieContext of Overzicht dan hele bericht als retour -->
				<xsl:when test="$FoutInHeader='false' and $FoutInDeclaratieContext='false' and $FoutInOverzicht='false'">
					<xsl:apply-templates select="gds801:Header"/>
					<xsl:apply-templates select="gds801:DeclaratieContext"/>
					<xsl:apply-templates select="gds801:Overzicht"/>
					<xsl:apply-templates select="gds801:Verzekerde"/>
  				</xsl:when>
				<!-- Wel errors in de Header, DeclaratieContext of Overzicht dan alleen Header, DeclaratieContext en Overzicht als retour -->
				<xsl:otherwise>
					<xsl:apply-templates select="gds801:Header"/>
					<xsl:apply-templates select="gds801:DeclaratieContext"/>
					<xsl:apply-templates select="gds801:Overzicht"/>
				</xsl:otherwise>
			</xsl:choose>				
		</gds802:Bericht>
	</xsl:template>
	
	<xsl:template match="gds801:Header">
		<!-- klasse Header opbouwen -->
		<gds802:Header>
			<gds802:Berichtcode>574</gds802:Berichtcode>
			<!-- gehanteerde Berichtversie en Berichtsubversie voor retourbericht -->
			<gds802:Berichtversie>1</gds802:Berichtversie>
			<gds802:Berichtsubversie>0</gds802:Berichtsubversie>
			<xsl:apply-templates select="gds801:Berichtsoort" mode="copy-if-exists"/>
			<!-- als Vecozo is verzender van het retourbericht dan vullen met gegevens van Vecozo, anders met de gegevens van de verzender van het declaratiebericht -->
			<xsl:choose>
				<xsl:when test="$VerzenderRetourbericht = 'Vecozo'">
					<gds802:VerzenderRol>
						<xsl:value-of select="$VerzenderRolVecozo"/>
					</gds802:VerzenderRol>
				</xsl:when>
				<xsl:otherwise>
					<gds802:Verzender><xsl:value-of select="gds801:Ontvanger"/></gds802:Verzender>
					<gds802:VerzenderRol><xsl:value-of select="gds801:OntvangerRol"/></gds802:VerzenderRol>
				</xsl:otherwise>
			</xsl:choose>
			<!-- Ontvanger in retourbericht is Verzender uit declaratiebericht -->
			<gds802:Ontvanger><xsl:value-of select="gds801:Verzender"/></gds802:Ontvanger>
			<!-- OntvangerRol in retourbericht is VerzenderRol uit declaratiebericht -->
			<gds802:OntvangerRol><xsl:value-of select="gds801:VerzenderRol"/></gds802:OntvangerRol>
			<gds802:Verzenddatum><xsl:value-of select="$HuidigeDatum"/></gds802:Verzenddatum>
			<!-- als Referentienummer van retourbericht het Referentienummer van declaratiebericht hanteren -->
			<xsl:apply-templates select="gds801:Referentienummer" mode="copy-if-exists"/>
			<!-- feedback klasse Header toevoegen -->
			<xsl:copy-of select="$rc003"/>
			<xsl:copy-of select="$rc006"/>
			<xsl:copy-of select="$vc001"/>
			<xsl:copy-of select="$vc002"/>
			<xsl:copy-of select="$vc004"/>
			<xsl:copy-of select="$vc006"/>
		</gds802:Header>
	</xsl:template>
	
	<xsl:template match="gds801:DeclaratieContext">
		<!-- klasse DeclaratieContext volledig retourneren -->
		<gds802:DeclaratieContext>
			<xsl:apply-templates select="gds801:Declarant"/>
			<xsl:apply-templates select="gds801:Zorgaanbieder"/>
			<xsl:apply-templates select="gds801:BetalingAanServicebureau" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:Factuurnummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:Factuurdatum" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:BtwIdentificatienummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:Valutacode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:InformatiesysteemCode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:InformatiesysteemVersie" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:BegindatumDeclaratieperiode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:EinddatumDeclaratieperiode" mode="copy-if-exists"/>
			<!-- feedback klasse DeclaratieContext toevoegen -->
			<xsl:copy-of select="$vc007"/>
			<xsl:copy-of select="$vc008"/>
			<xsl:copy-of select="$vc009"/>
			<xsl:copy-of select="$vc010"/>
			<xsl:copy-of select="$vc012"/>
			<xsl:copy-of select="$vc013"/>
			<xsl:copy-of select="$vc014"/>
			<xsl:copy-of select="$vc015"/>
			<xsl:copy-of select="$vc098"/>
			<xsl:copy-of select="$vc111"/>
			<xsl:copy-of select="$vc171"/>
			<xsl:copy-of select="$rc052"/>
		</gds802:DeclaratieContext>
	</xsl:template>
	
	<xsl:template match="gds801:Declarant">
		<!-- klasse Declarant is onderdeel van DeclaratieContext, alle gegevens van type ZorgaanbiederBeperkt retourneren -->
		<gds802:Declarant>
			<xsl:apply-templates select="gds801:Zorgaanbiedercode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:ZorgaanbiederSoort" mode="copy-if-exists"/>
			<!-- feedback klasse Declarant toevoegen -->
			<xsl:copy-of select="$rc008"/>
		</gds802:Declarant>
	</xsl:template>
	
	<xsl:template match="gds801:Zorgaanbieder">
		<gds802:Zorgaanbieder>
			<xsl:choose>
				<!-- bevat bovenliggende klasse het element Factuurnummer dan is klasse Zorgaanbieder (card 0,1) onderdeel van DeclaratieContext, alle gegevens van type ZorgaanbiederBeperkt retourneren -->
				<xsl:when test="../gds801:Factuurnummer">
					<xsl:apply-templates select="gds801:Zorgaanbiedercode" mode="copy-if-exists"/>
					<xsl:apply-templates select="gds801:ZorgaanbiederSoort" mode="copy-if-exists"/>
					<!-- feedback klasse Zorgaanbieder toevoegen -->
					<xsl:copy-of select="$rc010"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- als bovenliggende klasse niet het element Factuurnummer bevat, dan is sprake van de klasse Zorgaanbieder in DebetPrestatie en is sprake van uitgebreide zorgaanbiedergegevens (0..n keer), dan identificerende gegevens retourneren -->
					<!-- retourneer identificerende gegevens van Zorgaanbieder -->
					<xsl:apply-templates select="gds801:Zorgaanbiedercode" mode="copy-if-exists"/>
					<xsl:apply-templates select="gds801:ZorgaanbiederSoort" mode="copy-if-exists"/>
					<xsl:apply-templates select="gds801:ZorgaanbiederSpecificatie" mode="copy-if-exists"/>
					<xsl:if test="gds801:NaamZorgverlener">
						<gds802:NaamZorgverlener>
							<xsl:apply-templates select="gds801:NaamZorgverlener/gds801:Initialen" mode="copy-if-exists"/>
							<xsl:if test="gds801:NaamZorgverlener/gds801:Geslachtsnaam">
								<gds802:Geslachtsnaam>
									<xsl:apply-templates select="gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Voorvoegsels" mode="copy-if-exists"/> 
									<xsl:apply-templates select="gds801:NaamZorgverlener/gds801:Geslachtsnaam/gds801:Achternaam" mode="copy-if-exists"/> 
								</gds802:Geslachtsnaam>
							</xsl:if>
						</gds802:NaamZorgverlener>
					</xsl:if>
					<xsl:apply-templates select="gds801:BeroepZorgverlener" mode="copy-if-exists"/>
					<xsl:apply-templates select="gds801:ZorgaanbiederRol" mode="copy-if-exists"/>
					<!-- controles klasse Zorgaanbieder uitvoeren -->
					<!-- RC023: Indien Zorgaanbieder/Zorgaanbiedersoort voorkomt, dan moet Zorgaanbieder/Zorgaanbiedersoort voorkomen in zorgaanbiedersoort codelijst. -->
					<xsl:call-template name="rcCode_vs_Peildatum">
						<xsl:with-param name="Codelijst" select="'codelijsten/CL0015-VEKT.xml'"/>
						<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9352'"/>
						<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
						<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
						<xsl:with-param name="Code" select="gds801:ZorgaanbiederSoort"/>
						<xsl:with-param name="Peildatum" select="geenpeildatum"/>
					</xsl:call-template>
					<!-- RC024: Indien Zorgaanbieder/ZorgaanbiederSpecificatie voorkomt, dan moet Zorgaanbieder/ZorgaanbiederSpecificatie voorkomen in ZorgverlenersSpecificatie (subberoepsgroep) codelijst. | Indien Zorgaanbieder/ZorgaanbiederSpecificatie voorkomt en Zorgaanbieder/ZorgaanbiederSpecificatie in zorgverlenersspecificatie (subberoepsgroep) codelijst voorkomt, dan moet de waarde van DebetPrestatie/Begindatum groter zijn dan of gelijk zijn aan de ingangsdatum Zorgverlenersspecificatie (subberoepsgroep) van Zorgaanbieder/ZorgaanbiederSpecificatie. | Indien Zorgaanbieder/ZorgaanbiederSpecificatie voorkomt en expiratiedatum zorgverlenersspecificatie (subberoepsgroep) gevuld is, dan moet de waarde van DebetPrestatie/Begindatum kleiner zijn dan de waarde van expiratiedatum zorgverlenersspecificatie (subberoepsgroep) van Zorgaanbieder/ZorgaanbiederSpecificatie. -->
					<xsl:call-template name="rcCode_vs_Peildatum">
						<xsl:with-param name="Codelijst" select="'codelijsten/COD016-VEKT.xml'"/>
						<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9353'"/>
						<xsl:with-param name="RetourcodeIngangsdatum" select="'9354'"/>
						<xsl:with-param name="RetourcodeExpiratiedatum" select="'9355'"/>
						<xsl:with-param name="Code" select="gds801:ZorgaanbiederSpecificatie"/>
						<xsl:with-param name="Peildatum" select="../gds801:Begindatum"/>
					</xsl:call-template>
					<!-- RC025: Zorgaanbieder/ZorgaanbiederRol moet voorkomen in zorgaanbiederrol codelijst. -->
					<xsl:call-template name="rcCode_vs_Peildatum">
						<xsl:with-param name="Codelijst" select="'codelijsten/CL0014-VEKT.xml'"/>
						<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9356'"/>
						<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
						<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
						<xsl:with-param name="Code" select="gds801:ZorgaanbiederRol"/>
						<xsl:with-param name="Peildatum" select="geenpeildatum"/>
					</xsl:call-template>
					<!-- RC026: Indien Zorgaanbieder/BeroepZorgverlener voorkomt, dan moet Zorgaanbieder/BeroepZorgverlener voorkomen in Beroepen codelijst. | Indien Zorgaanbieder/BeroepZorgverlener voorkomt en Zorgaanbieder/BeroepZorgverlener in beroepen codelijst voorkomt, dan moet de waarde van DebetPrestatie/Begindatum groter zijn dan of gelijk zijn aan de ingangsdatum beroep van Zorgaanbieder/BeroepZorgverlener. | Indien Zorgaanbieder/BeroepZorgverlener voorkomt en expiratiedatum beroep gevuld is, dan moet de waarde van DebetPrestatie/Begindatum kleiner zijn dan de waarde van expiratiedatum beroep van Zorgaanbieder/BeroepZorgverlener. -->
					<xsl:call-template name="rcCode_vs_Peildatum">
						<xsl:with-param name="Codelijst" select="'codelijsten/CL0001-VEKT.xml'"/>
						<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9357'"/>
						<xsl:with-param name="RetourcodeIngangsdatum" select="'9358'"/>
						<xsl:with-param name="RetourcodeExpiratiedatum" select="'9359'"/>
						<xsl:with-param name="Code" select="gds801:BeroepZorgverlener"/>
						<xsl:with-param name="Peildatum" select="../gds801:Begindatum"/>
					</xsl:call-template>
					<!-- VC057: Indien Zorgaanbiedercode voorkomt, dan mag ZorgaanbiederSpecificatie, BeroepZorgverlener of NaamZorgverlener niet voorkomen. -->
					<xsl:call-template name="rc9291">
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
						<xsl:with-param name="NaamZorgverlener" select="gds801:NaamZorgverlener"/>
					</xsl:call-template>
					<!-- VC058: Indien Zorgaanbiedercode voorkomt, dan moet ZorgaanbiederSoort voorkomen. -->
					<xsl:call-template name="rc9292a">
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
					</xsl:call-template>
					<!-- VC062: Indien Zorgaanbiedercode niet voorkomt, dan mag ZorgaanbiederSoort niet voorkomen. -->
					<xsl:call-template name="rc9292b">
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
					</xsl:call-template>
					<!-- VC063: Indien ZorgaanbiederSpecificatie voorkomt, dan mag Zorgaanbiedercode of BeroepZorgverlener niet voorkomen. -->
					<xsl:call-template name="rc9294">
						<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
					</xsl:call-template>
					<!-- VC064: Indien PrestatieCodelijstCode = 071, en ZorgaanbiederSpecificatie of BeroepZorgverlener voorkomt, dan moet NaamZorgverlener voorkomen. -->
					<xsl:call-template name="rc9417">
						<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
						<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
						<xsl:with-param name="NaamZorgverlener" select="gds801:NaamZorgverlener"/>
					</xsl:call-template>
					<!-- VC065: Indien BeroepZorgverlener voorkomt, dan mag Zorgaanbiedercode of ZorgaanbiederSpecificatie niet voorkomen. -->
					<xsl:call-template name="rc9418">
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
					</xsl:call-template>
					<!-- VC066: Indien BeroepZorgverlener voorkomt, dan moet ZorgaanbiederRol = 01 (= Behandelaar). -->
					<xsl:call-template name="rc9422">
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
						<xsl:with-param name="ZorgaanbiederRol" select="gds801:ZorgaanbiederRol"/>
					</xsl:call-template>
					<!-- VC067: Indien PrestatieCodelijstCode niet = 071 (= NZa Codelijst ZPM), dan mag BeroepZorgverlener niet voorkomen. -->
					<xsl:call-template name="rc9423">
						<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
					</xsl:call-template>
					<!-- VC068: Indien Berichtcode = 573, dan moet Zorgaanbiedercode of ZorgaanbiederSpecificatie of BeroepZorgverlener voorkomen. -->
					<xsl:call-template name="rc9424">
						<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
						<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
					</xsl:call-template>
					<!-- VC104: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ZorgaanbiederRol = 01 (= Behandelaar) en Zorgaanbiedercode voorkomt, dan moet ZorgaanbiederSoort = 1(= Instelling) of 3 (= Zorgverlener). -->
					<xsl:call-template name="rc9478">
						<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
						<xsl:with-param name="ZorgaanbiederRol" select="gds801:ZorgaanbiederRol"/>
						<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
						<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
					</xsl:call-template>
					<!-- VC105: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ZorgaanbiederRol = 02 (= Regiebehandelaar), dan moet ZorgaanbiederSoort = 3 (= Zorgverlener). -->
					<xsl:call-template name="rc9479">
						<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
						<xsl:with-param name="ZorgaanbiederRol" select="gds801:ZorgaanbiederRol"/>
						<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
					</xsl:call-template>					
				</xsl:otherwise>
			</xsl:choose>
		</gds802:Zorgaanbieder>
	</xsl:template>
	
	<xsl:template match="gds801:NaamZorgverlener">
		<!-- geen controles voor klasse NaamZorgverlener -->
	</xsl:template>
	
	<xsl:template match="gds801:Overzicht">
		<!-- klasse Overzicht volledig retourneren -->
		<gds802:Overzicht>
			<xsl:apply-templates select="gds801:TotaalDeclaratiebedragInclBtw"/>
			<!-- als Vecozo is verzender van het retourbericht dan klassen TotaalToegekendBedragInclBtwFinancieel en TotaalToegekendBedragInclBtwNietFinancieel toevoegen. De bedragen zijn op basis van de uitgevoerde controles in deze XSLT altijd nul. -->
			<xsl:if test="$VerzenderRetourbericht = 'Vecozo'">
				<gds802:TotaalToegekendBedragInclBtwFinancieel>
					<gds802:Bedrag>0.00</gds802:Bedrag>
					<gds802:DebetCreditCode>D</gds802:DebetCreditCode>
				</gds802:TotaalToegekendBedragInclBtwFinancieel>
				<gds802:TotaalToegekendBedragInclBtwNietFinancieel>
					<gds802:Bedrag>0.00</gds802:Bedrag>
					<gds802:DebetCreditCode>D</gds802:DebetCreditCode>
				</gds802:TotaalToegekendBedragInclBtwNietFinancieel>
			</xsl:if>	
			<!-- feedback klasse Overzicht toevoegen -->
			<xsl:copy-of select="$vc016"/>
		</gds802:Overzicht>
	</xsl:template>
	
	<xsl:template match="gds801:TotaalDeclaratiebedragInclBtw">
		<!-- klasse TotaalDeclaratiebedragInclBtw is onderdeel van Overzicht, alle gegevens retourneren -->
		<gds802:TotaalDeclaratiebedragInclBtw>
			<xsl:apply-templates select="gds801:Bedrag" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:DebetCreditCode" mode="copy-if-exists"/>
			<!-- feedback klasse TotaalDeclaratiebedragInclBtw toevoegen -->
			<xsl:copy-of select="$rc046"/>
		</gds802:TotaalDeclaratiebedragInclBtw>
	</xsl:template>
	
	<xsl:template match="gds801:Verzekerde">
		<gds802:Verzekerde>
			<!-- retourneer identificerende gegevens van Verzekerde -->
			<xsl:apply-templates select="gds801:BSN" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:UzoviNummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:Verzekerdennummer" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:PatientIdentificatienummer" mode="copy-if-exists"/>
			<!-- controles klasse Verzekerde uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:BuitenlandVerzekerde"/>
			<xsl:apply-templates select="gds801:AanvullendeVerzekerdegegevens"/>
			<xsl:apply-templates select="gds801:Prestatie"/>
			<!-- VC017: Indien Ontvanger = 9992 (= DJI/FZ) of = 7125 (= Orgaan van Verblijf), dan mag BSN niet voorkomen. -->
			<xsl:call-template name="rc9268">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="BSN" select="gds801:BSN"/>
			</xsl:call-template>
			<!-- VC018: Indien Verzekerdennummer niet voorkomt en Ontvanger niet = 9992 (= DJI/FZ) of = 7125 (= Orgaan van Verblijf), dan moet BSN voorkomen. -->
			<xsl:call-template name="rc0435">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="Verzekerdennummer" select="gds801:Verzekerdennummer"/>
				<xsl:with-param name="BSN" select="gds801:BSN"/>
			</xsl:call-template>
			<!-- VC019: Indien OntvangerRol niet = 2 (= Servicebureau), dan moet de waarde van UzoviNummer gelijk zijn aan de waarde van Ontvanger. -->
			<xsl:call-template name="rc9269">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="UzoviNummer" select="gds801:UzoviNummer"/>
			</xsl:call-template>
			<!-- VC020: Indien BSN niet voorkomt, dan moet Verzekerdennummer voorkomen. -->
			<xsl:call-template name="rc8101">
				<xsl:with-param name="BSN" select="gds801:BSN"/>
				<xsl:with-param name="Verzekerdennummer" select="gds801:Verzekerdennummer"/>
			</xsl:call-template>
			<!-- VC021: Indien Verzekerde/Geboortedatum voorkomt, dan moet de waarde van Verzekerde/Geboortedatum kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Geboortedatum"/>
				<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9270'"/>
			</xsl:call-template>
			<!-- VC022: Indien Ontvanger = 9992 (= DJI/FZ), dan mag Verzekerde/Geboortedatum niet voorkomen. -->
			<xsl:call-template name="rc9271">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="Geboortedatum" select="gds801:Geboortedatum"/>
			</xsl:call-template>
			<!-- VC023: Indien Ontvanger niet = 9992 (=  DJI/FZ), dan moet Geboortedatum voorkomen. -->
			<xsl:call-template name="rc8151">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="Geboortedatum" select="gds801:Geboortedatum"/>
			</xsl:call-template>
			<!-- VC024: Indien Ontvanger = 7125 (Orgaan van Verblijf), dan moet BuitenlandVerzekerde voorkomen. -->
			<xsl:call-template name="rc9272">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="BuitenlandVerzekerde" select="gds801:BuitenlandVerzekerde"/>
			</xsl:call-template>
			<!-- VC025: Indien OntvangerRol = 2 (= Servicebureau), dan moet AanvullendeVerzekerdegegevens voorkomen. -->
			<xsl:call-template name="rc9273">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="AanvullendeVerzekerdegegevens" select="gds801:AanvullendeVerzekerdegegevens"/>
			</xsl:call-template>
			<!-- VC026: Indien OntvangerRol niet = 2 (= Servicebureau), dan mag AanvullendeVerzekerdegegevens niet voorkomen. -->
			<xsl:call-template name="rc9274">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="AanvullendeVerzekerdegegevens" select="gds801:AanvullendeVerzekerdegegevens"/>
				<xsl:with-param name="GeslachtCode" select="gds801:AanvullendeVerzekerdegegevens/gds801:GeslachtCode"/>
			</xsl:call-template>
			<!-- VC056: Indien Ontvanger niet = 7125 (= Orgaan van tijdelijk verblijf), dan mag BuitenlandVerzekerde niet voorkomen. -->
			<xsl:call-template name="rc9416">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="BuitenlandVerzekerde" select="gds801:BuitenlandVerzekerde"/>
			</xsl:call-template>
			<!-- VC060: Indien BSN voorkomt, dan mag Verzekerdennummer niet voorkomen. -->
			<xsl:call-template name="rc9420">
				<xsl:with-param name="BSN" select="gds801:BSN"/>
				<xsl:with-param name="Verzekerdennummer" select="gds801:Verzekerdennummer"/>
			</xsl:call-template>
		</gds802:Verzekerde>
	</xsl:template>
	
	<xsl:template match="gds801:BuitenlandVerzekerde">
		<gds802:BuitenlandVerzekerde>
			<!-- controles klasse BuitenlandVerzekerde uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Bijlage"/>
		</gds802:BuitenlandVerzekerde>
	</xsl:template>
	
	<xsl:template match="gds801:Bijlage">
		<!-- geen controles voor klasse Bijlage -->
	</xsl:template>
	
	<xsl:template match="gds801:AanvullendeVerzekerdegegevens">
		<gds802:AanvullendeVerzekerdegegevens>
			<!-- controles klasse AanvullendeVerzekerdegegevens uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Naamgegevens"/>
			<xsl:apply-templates select="gds801:Adresgegevens"/>
			<xsl:apply-templates select="gds801:Debiteur"/>
			<!-- Controles voor Servicebureau -->
			<xsl:if test="$OntvangerRol='2'">
				<!-- RC015: AanvullendeVerzekerdeGegegevens/GeslachtCode moet voorkomen in code geslacht codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD046-NEN.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9329'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:GeslachtCode"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>
			</xsl:if>
		</gds802:AanvullendeVerzekerdegegevens>
	</xsl:template>
	
	<xsl:template match="gds801:Debiteur">
		<gds802:Debiteur>
			<!-- controles klasse Debiteur uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Naamgegevens"/>
			<xsl:apply-templates select="gds801:Adresgegevens"/>
			<xsl:apply-templates select="gds801:Contactgegevens"/>
			<xsl:apply-templates select="gds801:Bankgegevens"/>
			<!-- Controles voor Servicebureau -->
			<xsl:if test="$OntvangerRol='2'">
				<!-- RC015: Debiteur/GeslachtCode moet voorkomen in code geslacht codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD046-NEN.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9330'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:GeslachtCode"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>			
				<!-- RC016: SoortRelatie moet voorkomen in soort relatie codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD821-VEKT.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9331'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:SoortRelatie"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>
				<!-- RC017: IncassoCode moet voorkomen in code incasso codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD908-VEKT.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9332'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:IncassoCode"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>			
				<!-- RC018: Facturatievorm moet voorkomen in facturatievorm codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD655-VEKT.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9333'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:Facturatievorm"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>			
			</xsl:if>					
			<!-- VC027: Indien Debiteur/Geboortedatum voorkomt, dan moet de waarde van Debiteur/Geboortedatum kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Geboortedatum"/>
				<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9275'"/>
			</xsl:call-template>
			<!-- VC028: Indien OverlijdensIndicator  = Ja (= Overleden), dan moet SoortRelatie voorkomen. -->
			<xsl:call-template name="rc9276">
				<xsl:with-param name="OverlijdensIndicator" select="../gds801:OverlijdensIndicator"/>
				<xsl:with-param name="SoortRelatie" select="gds801:SoortRelatie"/>
			</xsl:call-template>
		</gds802:Debiteur>
	</xsl:template>
	
	<xsl:template match="gds801:Naamgegevens">
		<gds802:Naamgegevens>
			<!-- controles klasse Naamgegevens uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Geslachtsnaam"/>
			<xsl:apply-templates select="gds801:GeslachtsnaamPartner"/>
			<!-- Controles voor Servicebureau -->
			<xsl:if test="$OntvangerRol='2'">
			<!-- RC047: Indien Naamgebruik voorkomt, dan moet Naamgebruilk voorkomen in Naamcode/naamgebruik. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD700-NEN1.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9407'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:Naamgebruik"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>				
			</xsl:if>	
		</gds802:Naamgegevens>
	</xsl:template>
	
	<xsl:template match="gds801:Geslachtsnaam">
		<!-- geen controles voor klasse Geslachtsnaam -->
	</xsl:template>
	
	<xsl:template match="gds801:GeslachtsnaamPartner">
		<!-- geen controles voor klasse GeslachtsnaamPartner -->
	</xsl:template>
	
	<xsl:template match="gds801:Adresgegevens">
		<gds802:Adresgegevens>
			<!-- controles klasse Adresgegevens uitvoeren -->
			<!-- Controles voor Servicebureau -->
			<xsl:if test="$OntvangerRol='2'">
				<!-- RC048: Indien AanduidingBijNummer voorkomt, dan moet AanduidingBijNummer voorkomen in de aanduiding bij nummer codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0010-NICT.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9408'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:AanduidingBijNummer"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>			
				<!-- RC050: Indien Land voorkomt, dan moet Land voorkomen in code land. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/COD032-NEN.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9410'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:Land"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>
				<!-- RC051: Indien AdresSoort voorkomt, dan moet AdresSoort voorkomen in adres soort codelijst. -->
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0011-NICT.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9411'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
					<xsl:with-param name="Code" select="gds801:AdresSoort"/>
					<xsl:with-param name="Peildatum" select="geenpeildatum"/>
				</xsl:call-template>
			</xsl:if>	
		</gds802:Adresgegevens>
	</xsl:template>
	
	<xsl:template match="gds801:Contactgegevens">
		<!-- controles klasse Contactgegevens uitvoeren, eerst subklasses -->
	</xsl:template>
	
	<xsl:template match="gds801:Bankgegevens">
		<gds802:Bankgegevens>
			<!-- controles klasse Bankgegevens uitvoeren -->
		</gds802:Bankgegevens>
	</xsl:template>
	
	<xsl:template match="gds801:Prestatie">
		<gds802:Prestatie>
			<!-- controles klasse Prestatie uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:DebetPrestatie"/>
			<xsl:apply-templates select="gds801:CreditPrestatie"/>
		</gds802:Prestatie>
	</xsl:template>
	
	<xsl:template match="gds801:DebetPrestatie">
		<gds802:DebetPrestatie>
			<!-- retourneer identificerende gegevens van DebetPrestatie -->
			<xsl:apply-templates select="gds801:Referentienummer" mode="copy-if-exists"/>
			<!-- controles klasse DebetPrestatie uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:AanvullendPrestatieKenmerk"/>
			<xsl:apply-templates select="gds801:Verwijzing"/>
			<xsl:apply-templates select="gds801:Zorgaanbieder"/>
			<xsl:apply-templates select="gds801:AanvullendePrestatiegegevens"/>
			<!-- als Vecozo is verzender van het retourbericht dan berekende en toegekende bedragen toevoegen. De bedragen zijn op basis van de uitgevoerde controles in deze XSLT altijd nul. -->
			<xsl:if test="$VerzenderRetourbericht = 'Vecozo'">
				<gds802:BerekendBedragVerzekeraarInclBtw>0.00</gds802:BerekendBedragVerzekeraarInclBtw>
				<gds802:ToegekendBedragInclBtwFinancieel>0.00</gds802:ToegekendBedragInclBtwFinancieel>
				<gds802:ToegekendBedragInclBtwNietFinancieel>0.00</gds802:ToegekendBedragInclBtwNietFinancieel>
			</xsl:if>	
			<!-- RC019: PrestatieCodelijstCode moet voorkomen in aanduiding prestatiecodelijst codelijst. | Indien PrestatieCodelijstCode in aanduiding prestatiecodelijst voorkomt, dan moet de waarde van DebetPrestatie/Begindatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum aanduiding prestatiecodelijst van PrestatieCodelijstCode. | Indien expiratiedatum aanduiding prestatiecodelijst gevuld is, dan moet de waarde van DebetPrestatie/Begindatum kleiner zijn dan de waarde van expiratiedatum aanduiding prestatiecodelijst van PrestatieCodelijstCode. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD367-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9334'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9336'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9338'"/>
				<xsl:with-param name="Code" select="gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="Peildatum" select="gds801:Begindatum"/>
			</xsl:call-template>
			<!-- RC021: Indien SoortKosten voorkomt, dan moet SoortKosten voorkomen in soort kosten codelijst. | Indien SoortKosten voorkomt en SoortKosten in soort kosten codelijst voorkomt, dan moet de waarde van DebetPrestatie/Begindatum groter zijn dan of gelijk zijn aan de ingangsdatum soort kosten van SoortKosten. | Indien SoortKosten voorkomt en expiratiedatum soort kosten gevuld is, dan moet de waarde van DebetPrestatie/Begindatum kleiner zijn dan de waarde van expiratiedatum Code-element van SoortKosten. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD076-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9346'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9347'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9348'"/>
				<xsl:with-param name="Code" select="gds801:SoortKosten"/>
				<xsl:with-param name="Peildatum" select="gds801:Begindatum"/>
			</xsl:call-template>
			<!-- RC027: Herdeclaratiecode moet voorkomen in code herdeclaratie codelijst. --> 
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD651-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9360'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:Herdeclaratiecode"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>
			<!-- RC028: InformatieCode moet voorkomen in informatiecode codelijst. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0013-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9361'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:InformatieCode"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>
			<!-- VC030: Indien TariefInclBtw = 0.00, of BerekendBedragInclBtw = 0.00 of DeclaratieBedragInclBtw = 0.00, dan moet TariefInclBtw = 0.00 en BerekendBedragInclBtw = 0.00 en DeclaratieBedragInclBtw = 0.00. -->
			<xsl:call-template name="rc9278a">
				<xsl:with-param name="TariefInclBtw" select="gds801:TariefInclBtw"/>
				<xsl:with-param name="BerekendBedragInclBtw" select="gds801:BerekendBedragInclBtw"/>
				<xsl:with-param name="DeclaratieBedragInclBtw" select="gds801:DeclaratieBedragInclBtw"/>
			</xsl:call-template>
			<!-- VC031: Indien TariefInclBtw > 0.00, of BerekendBedragInclBtw > 0.00 of DeclaratieBedragInclBtw > 0.00, dan moet TariefInclBtw > 0.00 en BerekendBedragInclBtw > 0.00 en DeclaratieBedragInclBtw > 0.00. -->
			<xsl:call-template name="rc9278b">
				<xsl:with-param name="TariefInclBtw" select="gds801:TariefInclBtw"/>
				<xsl:with-param name="BerekendBedragInclBtw" select="gds801:BerekendBedragInclBtw"/>
				<xsl:with-param name="DeclaratieBedragInclBtw" select="gds801:DeclaratieBedragInclBtw"/>
			</xsl:call-template>
			<!-- VC172: Indien versie = 1.0, dan moet Begindatum van de DebetPrestatie kleiner zijn dan 1-1-2027.   -->
			<xsl:call-template name="rc9798">
				<xsl:with-param name="Begindatum" select="gds801:Begindatum"/> 
			</xsl:call-template>
			<!-- VC032: De waarde van DebetPrestatie/Begindatum moet kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Begindatum"/>
				<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'8989'"/>
			</xsl:call-template>
			<!-- VC033: Indien DebetPrestatie/Einddatum voorkomt, dan moet de waarde van DebetPrestatie/Begindatum kleiner zijn dan de waarde van DebetPrestatie/Einddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Einddatum"/>
				<xsl:with-param name="Peildatum" select="gds801:Begindatum"/>
				<xsl:with-param name="Vergelijking" select="'groterdan'"/>
				<xsl:with-param name="Retourcode" select="'9458'"/>
			</xsl:call-template>
			<!-- VC034: Indien DebetPrestatie/Eindtijd voorkomt en DebetPrestatie/Einddatum niet voorkomt, dan moet de waarde van DebetPrestatie/Begintijd kleiner zijn dan de waarde van DebetPrestatie Eindtijd. -->
			<xsl:call-template name="rc9279">
				<xsl:with-param name="Einddatum" select="gds801:Einddatum"/>
				<xsl:with-param name="Begintijd" select="gds801:Begintijd"/>
				<xsl:with-param name="Eindtijd" select="gds801:Eindtijd"/>
			</xsl:call-template>
			<!-- VC036: Indien Zorgaanbieder voorkomt, dan mag ZorgaanbiederRol niet 03 (verwijzer) of 04 (diagnosesteller) zijn. -->
			<xsl:call-template name="rc9281">
				<xsl:with-param name="Zorgaanbieder" select="gds801:Zorgaanbieder"/>
				<xsl:with-param name="ZorgaanbiederRol" select="gds801:Zorgaanbieder/gds801:ZorgaanbiederRol"/>
			</xsl:call-template>
			<!-- VC037: Indien Ontvanger = 9992 (= DJI/FZ), dan mag Herdeclaratiecode 02 (= Initiële declaratie na afwijzing door of creditering bij andere zorgverzekeraar) niet voorkomen. -->
			<xsl:call-template name="rc9282">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="Herdeclaratiecode" select="gds801:Herdeclaratiecode"/>
			</xsl:call-template>
			<!-- VC038: Indien OntvangerRol = 3 (= Zorgverzekeraar), = 4 (= DJI) of = 5 (= Zorgkantoor), dan moet DoorsturenToegestaan = Ja. -->
			<xsl:call-template name="rc8179">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="DoorsturenToegestaan" select="gds801:DoorsturenToegestaan"/>
			</xsl:call-template>
			<!-- VC040: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM), dan moet Zorgtraject voorkomen. -->
			<!-- Geplaatst in DebetPrestatie en niet in AanvullendePrestatiegegevens, omdat Zorgtraject voor moet komen ongeacht of AanvullendePrestatiegegevens voorkomt. -->
			<xsl:call-template name="rc9439">
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="Zorgtraject" select="gds801:AanvullendePrestatiegegevens/gds801:Zorgtraject"/>
			</xsl:call-template>
			<!-- VC041: Indien Ontvanger = 9992 (= DJI/FZ), dan moet  Plaatsingsbesluit voorkomen. -->
			<!-- Geplaatst in DebetPrestatie en niet in AanvullendePrestatiegegevens, omdat Plaatsingsbesluit voor moet komen ongeacht of AanvullendePrestatiegegevens voorkomt. -->
			<xsl:call-template name="rc9284">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="Plaatsingsbesluit" select="gds801:AanvullendePrestatiegegevens/gds801:Plaatsingsbesluit"/>
			</xsl:call-template>
			<!-- VC069: Indien Berichtcode = 573, dan moet waarde PrestatieCodelijstCode = 071 (= NZa Codelijst ZPM). -->
			<xsl:call-template name="rc9425">
				<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
			<!-- VC070: Indien Ontvanger = 7125 (Orgaan van Tijdelijk Verblijf), dan mag PrestatiecodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) niet voorkomen. -->
			<xsl:call-template name="rc9440">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
			<!-- VC093: Indien Prestatiecodelijst = 071, dan moet Aantal gelijk zijn aan ‘1’. -->
			<xsl:call-template name="rc8049">
				<xsl:with-param name="Aantal" select="gds801:Aantal"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>			
			<!-- VC094: Indien Prestatiecodelijst = 071, dan mag Einddatum niet voorkomen. -->
			<xsl:call-template name="rc9465">
				<xsl:with-param name="Einddatum" select="gds801:Einddatum"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
			<!-- VC116: Indien Ontvangerrol is ongelijk 02 (= Servicebureau), dan mag PrestatieCodelijstCode met waarde 999 = ((Onderdeel van een) prestatie waarvoor geen code bestaat) niet voorkomen. -->
			<xsl:call-template name="rc9544">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
		</gds802:DebetPrestatie>
	</xsl:template>
	
	<xsl:template match="gds801:CreditPrestatie">
		<gds802:CreditPrestatie>
			<!-- retourneer identificerende gegevens van CreditPrestatie -->
			<xsl:apply-templates select="gds801:Referentienummer" mode="copy-if-exists"/>
			<!-- als Vecozo is verzender van het retourbericht dan toegekende bedragen toevoegen. De bedragen zijn op basis van de uitgevoerde controles in deze XSLT altijd nul. -->
			<xsl:if test="$VerzenderRetourbericht = 'Vecozo'">
				<gds802:ToegekendCreditBedragInclBtwFinancieel>0.00</gds802:ToegekendCreditBedragInclBtwFinancieel>
				<gds802:ToegekendCreditBedragInclBtwNietFinancieel>0.00</gds802:ToegekendCreditBedragInclBtwNietFinancieel>
			</xsl:if>	
			<!-- controles klasse CreditPrestatie uitvoeren -->
			<!-- RC019: PrestatieCodelijstCode moet voorkomen in aanduiding prestatiecodelijst codelijst. | Indien PrestatieCodelijstCode in aanduiding prestatiecodelijst voorkomt, dan moet de waarde van CreditPrestatie/Begindatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum aanduiding prestatiecodelijst van PrestatieCodelijstCode. | Indien expiratiedatum aanduiding prestatiecodelijst gevuld is, dan moet de waarde van CreditPrestatie/Begindatum kleiner zijn dan de waarde van expiratiedatum aanduiding prestatiecodelijst van PrestatieCodelijstCode. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD367-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9335'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9337'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9339'"/>
				<xsl:with-param name="Code" select="gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="Peildatum" select="gds801:Begindatum"/>
			</xsl:call-template>
			<!-- VC173: Indien versie = 1.0, dan moet Begindatum van de CreditPrestatie kleiner zijn dan 1-1-2027.   -->
			<xsl:call-template name="rc9799">
				<xsl:with-param name="Begindatum" select="gds801:Begindatum"/> 
			</xsl:call-template>
			<!-- VC039: De waarde van CreditPrestatie Begindatum moet kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Begindatum"/>
				<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9283'"/>
			</xsl:call-template>
			<!-- VC081: Indien Berichtcode = 573, dan moet waarde PrestatieCodelijstCode = 071 (= NZa Codelijst ZPM). -->
			<xsl:call-template name="rc9456">
				<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
			<!-- VC082: Indien Ontvanger = 7125 (Orgaan van Tijdelijk Verblijf), dan mag PrestatiecodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) niet voorkomen. -->
			<xsl:call-template name="rc9457">
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
			<!-- VC102: Controle of debetregels in hetzelfde bericht gecrediteerd worden (hetgeen niet mag). De waarde van CreditPrestatie/GerelateerdReferentienummer mag niet gelijk zijn aan de waarde van DebetPrestatie/Referentienummer in bericht. -->
			<xsl:call-template name="rc8062">
				<xsl:with-param name="GerelateerdReferentienummer" select="gds801:GerelateerdReferentienummer"/>
			</xsl:call-template>
			<!-- VC132: Indien Ontvangerrol is ongelijk 02 (= Servicebureau), dan mag PrestatieCodelijstCode met waarde 999 = ((Onderdeel van een) prestatie waarvoor geen code bestaat) niet voorkomen. -->
			<xsl:call-template name="rc9544">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="PrestatieCodelijstCode" select="gds801:PrestatieCodelijstCode"/>
			</xsl:call-template>
		</gds802:CreditPrestatie>
	</xsl:template>
	
	<xsl:template match="gds801:AanvullendPrestatieKenmerk">
		<gds802:AanvullendPrestatieKenmerk>
			<!-- retourneer identificerende gegevens van AanvullendPrestatieKenmerk -->
			<xsl:apply-templates select="gds801:ApkCodelijstCode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:ApkCode" mode="copy-if-exists"/>
			<!-- controles klasse AanvullendPrestatieKenmerk uitvoeren -->
			<!-- RC029: ApkCodelijstCode moet voorkomen in APK-codelijstcode codelijst. | Indien ApkCodelijstCode in APK-codelijstcode codelijst voorkomt, dan moet de waarde van DebetPrestatie/Begindatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum APK-codelijstcode van ApkCodelijstCode. | Indien expiratiedatum APK-codelijstcode gevuld is, dan moet de waarde van DebetPrestatie/Begindatum kleiner zijn dan de waarde van expiratiedatum APK-codelijstcode van ApkCodelijstCode. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0012-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9362'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9363'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9364'"/>
				<xsl:with-param name="Code" select="gds801:ApkCodelijstCode"/>
				<xsl:with-param name="Peildatum" select="../gds801:Begindatum"/>
			</xsl:call-template>
			<!-- RC030: Indien ApkCodelijstCode heeft waarde 001 (= Zorglabel), dan moet ApkCode voorkomen in zorglabel codelijst. -->
			<xsl:if test="gds801:ApkCodelijstCode = '001'">
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0003-NZA.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9365'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'9366'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'9367'"/>
					<xsl:with-param name="Code" select="gds801:ApkCode"/>
					<xsl:with-param name="Peildatum" select="../gds801:Begindatum"/>
				</xsl:call-template>
			</xsl:if>			
			<!-- VC061: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ApkCodelijstCode voorkomt, dan moet ApkCodelijstCode = ‘001’ (= Zorglabelcodelijst GGZ en FZ volgens ZPM) voorkomen. -->
			<xsl:call-template name="rc9421">
				<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="ApkCodelijstCode" select="gds801:ApkCodelijstCode"/>
			</xsl:call-template>
		</gds802:AanvullendPrestatieKenmerk>
	</xsl:template>
	
	<xsl:template match="gds801:Verwijzing">
		<gds802:Verwijzing>
			<!-- retourneer identificerende gegevens van Verwijzing -->
			<xsl:apply-templates select="gds801:TypeVerwijzingcode" mode="copy-if-exists"/>
			<!-- controles klasse Verwijzing uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Verwijzer"/>
			<!-- RC031: TypeVerwijzingCode moet voorkomen in verwijzing codelijst. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0004-NZA.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9368'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:TypeVerwijzingcode"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>			
			<!-- VC042: Indien Verwijsdatum voorkomt, dan moet de waarde van Verwijsdatum kleiner zijn dan of gelijk zijn aan de waarde van DebetPrestatie/Begindatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Verwijsdatum"/>
				<xsl:with-param name="Peildatum" select="../gds801:Begindatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9285'"/>
			</xsl:call-template>
			<!-- VC106: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger = 9992 (= DJI/FZ) en Verwijzing komt voor, dan mag TypeVerwijzingcode alleen = 06 (= Geen verwijzing, andere rechtsmatigheidgrond) zijn. -->
			<xsl:call-template name="rc9483">
				<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="TypeVerwijzingcode" select="gds801:TypeVerwijzingcode"/>
			</xsl:call-template>
			<!-- VC107: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en TypeVerwijzingcode = 01 (= Verwijzing aanwezig) of 02 (= Doorverwijzing), dan moet Verwijzer/ Zorgaanbiedercode voorkomen. -->
			<xsl:call-template name="rc9481">
				<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="TypeVerwijzingcode" select="gds801:TypeVerwijzingcode"/>
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Verwijzer/gds801:Zorgaanbiedercode"/>
			</xsl:call-template>			
			<!-- VC108: Indien TypeVerwijzingcode = 04 (= Geen verwijzing aanwezig vanwege uitzondering, door patiënt geen correspondentie toegestaan) of 05 (= Geen verwijzing) of 06 (= Geen verwijzing, andere rechtsmatigheidgrond), dan mag Verwijzer en Verwijsdatum niet voorkomen. -->
			<xsl:call-template name="rc9482">
				<xsl:with-param name="TypeVerwijzingcode" select="gds801:TypeVerwijzingcode"/>
				<xsl:with-param name="Verwijzer" select="gds801:Verwijzer"/>
				<xsl:with-param name="Verwijsdatum" select="gds801:Verwijsdatum"/>
			</xsl:call-template>
			<!-- VC109: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en TypeVerwijzingcode = 07 (= Verwijzing aanwezig, maar verwijzer heeft geen AGB-code), dan moet Verwijzer/ZorgaanbiederSpecificatie voorkomen. -->
			<xsl:call-template name="rc9484">
				<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="TypeVerwijzingcode" select="gds801:TypeVerwijzingcode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:Verwijzer/gds801:ZorgaanbiederSpecificatie"/>
			</xsl:call-template>	
			<!-- VC110: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM), dan mag TypeVerwijzingcode niet = 05 (= Geen verwijzing) zijn. -->
			<xsl:call-template name="rc9485">
				<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="TypeVerwijzingcode" select="gds801:TypeVerwijzingcode"/>
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
			</xsl:call-template>
			</gds802:Verwijzing>
	</xsl:template>
	
	<xsl:template match="gds801:Verwijzer">
		<gds802:Verwijzer>
			<!-- controles klasse Verwijzer uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:NaamZorgverlener"/>
			<!-- RC033: Indien Verwijzer/Zorgaanbiedersoort voorkomt, dan moet Verwijzer/ZorgaanbiederSoort voorkomen in zorgaanbiedersoort codelijst. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0015-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9374'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:ZorgaanbiederSoort"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>
			<!-- RC034: Indien Verwijzer/ZorgaanbiederSpecificatie voorkomt en Verwijsdatum niet voorkomt, dan moet Verwijzer/ZorgaanbiederSpecificatie voorkomen in zorgverlenersspecificatie (subberoepsgroep). | Indien Verwijzer/ZorgaanbiederSpecificatie en Verwijsdatum voorkomen, dan moet Verwijzer/ZorgaanbiederSpecificatie voorkomen in zorgverlenersspecificatie (subberoepsgroep) en moet de waarde van Verwijsdatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum zorgverlenersspecificatie van Verwijzer/ZorgaanbiederSpecificatie. | Indien Verwijzer/ZorgaanbiederSpecificatie en Verwijsdatum voorkomen en expiratiedatum zorgverlenersspecificatie gevuld is, dan moet de waarde van Verwijsdatum kleiner zijn dan de waarde van expiratiedatum zorgverlenersspecificatie van Verwijzer/ZorgaanbiederSpecificatie. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD016-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9375'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9376'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9377'"/>
				<xsl:with-param name="Code" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="Peildatum" select="../gds801:Verwijsdatum"/>
			</xsl:call-template>
			<!-- RC035: Verwijzer/ZorgaanbiederRol moet voorkomen in zorgaanbiederrol codelijst. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0014-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9378'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:ZorgaanbiederRol"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>
			<!-- VC071: Indien Zorgaanbiedercode voorkomt, dan mag ZorgaanbiederSpecificatie, BeroepZorgverlener of NaamZorgverlener niet voorkomen. -->
			<xsl:call-template name="rc9441">
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
				<xsl:with-param name="NaamZorgverlener" select="gds801:NaamZorgverlener"/>
			</xsl:call-template>
			<!-- VC073: Indien Zorgaanbiedercode voorkomt, dan moet ZorgaanbiederSoort voorkomen. -->
			<xsl:call-template name="rc9443a">
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
			</xsl:call-template>
			<!-- VC075: Indien Zorgaanbiedercode niet voorkomt, dan mag ZorgaanbiederSoort niet voorkomen. -->
			<xsl:call-template name="rc9443b">
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
			</xsl:call-template>
			<!-- VC077: Indien ZorgaanbiederSpecificatie voorkomt, dan mag Zorgaanbiedercode of BeroepZorgverlener niet voorkomen. -->
			<xsl:call-template name="rc9447">
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
			</xsl:call-template>
			<!-- VC079: Indien PrestatieCodelijstCode = 071, en ZorgaanbiederSpecificatie of BeroepZorgverlener voorkomt, dan moet NaamZorgverlener voorkomen. -->
			<xsl:call-template name="rc9449">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
				<xsl:with-param name="NaamZorgverlener" select="gds801:NaamZorgverlener"/>
			</xsl:call-template>
			<!-- VC081: Indien BeroepZorgverlener voorkomt, dan mag Zorgaanbiedercode en ZorgaanbiederSpecificatie niet voorkomen. -->
			<xsl:call-template name="rc9451">
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
			</xsl:call-template>
			<!-- VC082: Indien BeroepZorgverlener voorkomt, dan moet ZorgaanbiederRol = 01 (= Behandelaar) of 03 (= Verwijzer). -->
			<xsl:call-template name="rc9452">
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
				<xsl:with-param name="ZorgaanbiederRol" select="gds801:ZorgaanbiederRol"/>
			</xsl:call-template>
			<!-- VC083: Indien PrestatieCodelijstCode niet = 071 (= NZa Codelijst ZPM), dan mag BeroepZorgverlener niet voorkomen. -->
			<xsl:call-template name="rc9453">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
			</xsl:call-template>
			<!-- VC084: Indien Berichtcode = 573, dan moet Zorgaanbiedercode of ZorgaanbiederSpecificatie of BeroepZorgverlener voorkomen. -->
			<xsl:call-template name="rc9454">
				<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="BeroepZorgverlener" select="gds801:BeroepZorgverlener"/>
			</xsl:call-template>
		</gds802:Verwijzer>
	</xsl:template>
	
	<xsl:template match="gds801:AanvullendePrestatiegegevens">
		<gds802:AanvullendePrestatiegegevens>
			<!-- controles klasse AanvullendePrestatiegegevens uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Diagnose"/>
			<xsl:apply-templates select="gds801:Zorgtraject"/>
			<xsl:apply-templates select="gds801:Plaatsingsbesluit"/>
			
			<!-- VC059: Indien OntvangerRol = 3 (= Zorgverzekeraar) of 5 (= Zorgkantoor), dan mag Plaatsingsbesluit niet voorkomen. -->
			<xsl:call-template name="rc9419">
				<xsl:with-param name="OntvangerRol" select="$OntvangerRol"/>
				<xsl:with-param name="Plaatsingsbesluit" select="gds801:Plaatsingsbesluit"/>
				<xsl:with-param name="PlaatsingsbesluitNummer" select="gds801:Plaatsingsbesluit/gds801:PlaatsingsbesluitNummer"/>
			</xsl:call-template>
			<!-- VC099: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en DiagnoseCodelijstCode voorkomt, dan mag  DiagnoseCodelijstCode combinatie 029 en 033 niet voorkomen. -->
				<xsl:call-template name="rc9472">
					<xsl:with-param name="PrestatieCodelijstCode" select="../gds801:PrestatieCodelijstCode"/>
					<xsl:with-param name="DiagnoseCodelijstCode" select="./gds801:Diagnose/gds801:DiagnoseCodelijstCode"/>
				</xsl:call-template>
		</gds802:AanvullendePrestatiegegevens>
	</xsl:template>
	
	<xsl:template match="gds801:Diagnose">
		<gds802:Diagnose>
			<!-- retourneer identificerende gegevens van Diagnose-->
			<xsl:apply-templates select="gds801:DiagnoseCodelijstCode" mode="copy-if-exists"/>
			<xsl:apply-templates select="gds801:Diagnosecode" mode="copy-if-exists"/>
			<!-- controles klasse Diagnose uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:Diagnosesteller"/>
			<!-- RC036: Indien DiagnoseCodelijstCode voorkomt en Diagnosedatum niet voorkomt, dan moet DiagnoseCodelijstCode voorkomen in Aanduiding diagnosecodelijst. | Indien DiagnoseCodelijstCode en Diagnosedatum voorkomen, dan moet DiagnoseCodelijstCode voorkomen in aanduiding diagnosecodelijst en moet de waarde van Diagnosedatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum aanduiding diagnosecodelijst van DiagnoseCodelijstCode. | Indien DiagnoseCodelijstCode en Diagnosedatum voorkomen en expiratiedatum aanduiding diagnosecodelijst gevuld is, dan moet de waarde van Diagnosedatum kleiner zijn dan de waarde van expiratiedatum aanduiding diagnosecodelijst van DiagnoseCodelijstCode. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD392-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9380'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9381'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9382'"/>
				<xsl:with-param name="Code" select="gds801:DiagnoseCodelijstCode"/>
				<xsl:with-param name="Peildatum" select="gds801:Diagnosedatum"/>
			</xsl:call-template>
			<!-- RC037: Indien DiagnoseCodelijstCode heeft waarde 029, dan moet DiagnoseCode voorkomen in DSM hoofdgroepen GGZ codelijst. -->
			<xsl:if test="gds801:DiagnoseCodelijstCode = '029'">
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0005-NZA.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9383'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'9384'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'9385'"/>
					<xsl:with-param name="Code" select="gds801:Diagnosecode"/>
					<xsl:with-param name="Peildatum" select="gds801:Diagnosedatum"/>
				</xsl:call-template>
			</xsl:if>			
			<!-- RC038: Indien DiagnoseCodelijstCode heeft waarde 030, dan moet DiagnoseCode voorkomen in DSM hoofdgroepen FZ codelijst. -->
			<xsl:if test="gds801:DiagnoseCodelijstCode = '030'">
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0006-NZA.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9386'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'9387'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'9388'"/>
					<xsl:with-param name="Code" select="gds801:Diagnosecode"/>
					<xsl:with-param name="Peildatum" select="gds801:Diagnosedatum"/>
				</xsl:call-template>
			</xsl:if>			
			<!-- RC039: Indien DiagnoseCodelijstCode heeft waarde 031, dan moet DiagnoseCode voorkomen in zorgvraagtype GGZ codelijst. -->
			<xsl:if test="gds801:DiagnoseCodelijstCode = '031'">
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0007-NZA.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9389'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'9390'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'9391'"/>
					<xsl:with-param name="Code" select="gds801:Diagnosecode"/>
					<xsl:with-param name="Peildatum" select="gds801:Diagnosedatum"/>
				</xsl:call-template>
			</xsl:if>				
			<!-- RC040: Indien DiagnoseCodelijstCode heeft waarde 032, dan moet DiagnoseCode voorkomen in zorgvraagtype FZ codelijst. -->
			<xsl:if test="gds801:DiagnoseCodelijstCode = '032'">
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0008-NZA.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9392'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'9393'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'9394'"/>
					<xsl:with-param name="Code" select="gds801:Diagnosecode"/>
					<xsl:with-param name="Peildatum" select="gds801:Diagnosedatum"/>
				</xsl:call-template>
			</xsl:if>				
			<!-- RC041: Indien DiagnoseCodelijstCode heeft waarde 033, dan moet DiagnoseCode voorkomen in GB-ggz Profiel codelijst. -->
			<xsl:if test="gds801:DiagnoseCodelijstCode = '033'">
				<xsl:call-template name="rcCode_vs_Peildatum">
					<xsl:with-param name="Codelijst" select="'codelijsten/CL0009-NZA.xml'"/>
					<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9395'"/>
					<xsl:with-param name="RetourcodeIngangsdatum" select="'9396'"/>
					<xsl:with-param name="RetourcodeExpiratiedatum" select="'9397'"/>
					<xsl:with-param name="Code" select="gds801:Diagnosecode"/>
					<xsl:with-param name="Peildatum" select="gds801:Diagnosedatum"/>
				</xsl:call-template>
			</xsl:if>				
			<!-- VC043: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en PrivacyCode = Ja en DebetPrestatie/ BeginDatum kleiner dan 1-1-2024, dan mag DiagnoseCodelijstCode waarde 029 (= DSM hoofdgroep GGZ), 030 (= DSM hoofdgroep FZ), 031 (= Zorgvraagtype GGZ) en 032 (= Zorgvraagtype FZ) niet voorkomen. -->
			<xsl:call-template name="rc9286">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="PrivacyCode" select="../../gds801:PrivacyCode"/>
				<xsl:with-param name="Begindatum" select="../../gds801:Begindatum"/>
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
			</xsl:call-template>
			<!-- VC044: Indien Diagnose voorkomt en PrivacyCode = Nee, dan moet DiagnoseCodelijstCode voorkomen. -->
			<xsl:call-template name="rc9287a">
				<xsl:with-param name="PrivacyCode" select="../../gds801:PrivacyCode"/>
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
			</xsl:call-template>
			<!-- VC045: Indien PrestatieCodelijstCode = 071 (= NZa Codelijst ZPM) en DiagnoseCodelijstCode voorkomt en PrivacyCode = Nee, dan moet waarde DiagnoseCodelijstCode 029 (= DSM-hoofdgroep GGZ), 030 (= DSM-hoofdgroep FZ), 031 (= Zorgvraagtypering GGZ), 032 (= Zorgvraagtypering FZ) of 033 (= GB-ggz Profiel) voorkomen. -->
			<xsl:call-template name="rc9287b">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
				<xsl:with-param name="PrivacyCode" select="../../gds801:PrivacyCode"/>
			</xsl:call-template>
			<!-- VC046: Indien DiagnoseCodelijstCode voorkomt, dan moet Diagnosecode voorkomen. -->
			<xsl:call-template name="rc9288a">
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
				<xsl:with-param name="Diagnosecode" select="gds801:Diagnosecode"/>
			</xsl:call-template>
			<!-- VC047: Indien DiagnoseCodelijstCode niet voorkomt, dan mag Diagnosecode niet voorkomen. -->
			<xsl:call-template name="rc9288b">
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
				<xsl:with-param name="Diagnosecode" select="gds801:Diagnosecode"/>
			</xsl:call-template>
			<!-- VC048: Indien Diagnosedatum voorkomt, dan moet de waarde van Diagnosedatum kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:Diagnosedatum"/>
				<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9289'"/>
			</xsl:call-template>
			<!-- VC100: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger = 9992 (= DJI) en DiagnoseCodelijstCode voorkomt, dan mag alleen DiagnoseCodelijstCode 030 (= DSM hoofdgroep FZ) of 032 (= Zorgvraagtype FZ) voorkomen. -->
			<xsl:call-template name="rc9473">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
			</xsl:call-template>
			<!-- VC101: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en Ontvanger niet = 9992 (=DJI) en DiagnoseCodelijstCode voorkomt, dan mag alleen DiagnoseCodelijstCode 029 (= DSM hoofdgroep GGZ), 031 (= Zorgvraagtype GGZ) of 033 (= GB-ggz Profiel) voorkomen. -->
			<xsl:call-template name="rc9474">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="Ontvanger" select="$Ontvanger"/>
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
			</xsl:call-template>
			<!-- VC103: Indien PrestatieCodelijstCode = 071 ((= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en DiagnoseCodelijstCode voorkomt, dan moet de waarde van DiagnoseCodelijstCode binnen de prestatie uniek zijn. -->
			<xsl:call-template name="rc9475">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="DiagnoseCodelijstCode" select="gds801:DiagnoseCodelijstCode"/>
			</xsl:call-template>
			<!-- VC160: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en PrivacyCode = Ja en DebetPrestatie/BeginDatum groter dan of gelijk aan 1-1-2024, dan mag Diagnose niet voorkomen. -->
			<xsl:call-template name="rc9568">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="PrivacyCode" select="../../gds801:PrivacyCode"/>
				<xsl:with-param name="Begindatum" select="../../gds801:Begindatum"/>
			</xsl:call-template>
		</gds802:Diagnose>		
	</xsl:template>
	
	<xsl:template match="gds801:Diagnosesteller">
		<gds802:Diagnosesteller>
			<!-- controles klasse DiagnoseSteller uitvoeren, eerst subklasses -->
			<xsl:apply-templates select="gds801:NaamZorgverlener"/>
			<!-- RC043: Indien Diagnosesteller/Zorgaanbiedersoort voorkomt, dan moet Diagnosesteller/Zorgaanbiedersoort voorkomen in zorgaanbiedersoort codelijst. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0015-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9401'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:ZorgaanbiederSoort"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>
			<!-- RC044: Indien Diagnosesteller en ZorgaanbiederSpecificatie voorkomen en Diagnosedatum niet voorkomt, dan moet ZorgaanbiederSpecificatie voorkomen in zorgaanbiederspecificatie codelijst. | Indien Diagnosesteller/ZorgaanbiederSpecificatie en Diagnosedatum voorkomen en Diagnosesteller/ZorgaanbiederSpecificatie in zorgaanbiederspecificatie codelijst voorkomt, dan moet de waarde van Diagnosedatum groter zijn dan of gelijk zijn aan de waarde van ingangsdatum zorgaanbiederspecificatie van Diagnosesteller/ZorgaanbiederSpecificatie. | Indien Diagnosesteller/ZorgaanbiederSpecificatie en Diagnosedatum voorkomen en expiratiedatum zorgaanbiederspecificatie gevuld is, dan moet de waarde van Diagnosedatum kleiner zijn dan de waarde van expiratiedatum zorgaanbiederspecificatievan Diagnosesteller/ZorgaanbiederSpecificatie. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/COD016-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9402'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'9403'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'9404'"/>
				<xsl:with-param name="Code" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="Peildatum" select="../gds801:Diagnosedatum"/>
			</xsl:call-template>
			<!-- RC045: Diagnosesteller/ZorgaanbiederRol moet voorkomen in zorgaanbiederrol codelijst. -->
			<xsl:call-template name="rcCode_vs_Peildatum">
				<xsl:with-param name="Codelijst" select="'codelijsten/CL0014-VEKT.xml'"/>
				<xsl:with-param name="RetourcodeBestaanbaarheid" select="'9405'"/>
				<xsl:with-param name="RetourcodeIngangsdatum" select="'nvt'"/>
				<xsl:with-param name="RetourcodeExpiratiedatum" select="'nvt'"/>
				<xsl:with-param name="Code" select="gds801:ZorgaanbiederRol"/>
				<xsl:with-param name="Peildatum" select="geenpeildatum"/>
			</xsl:call-template>
			<!-- VC072: Indien Zorgaanbiedercode voorkomt, dan mag ZorgaanbiederSpecificatie of NaamZorgverlener niet voorkomen. -->
			<xsl:call-template name="rc9442">
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="NaamZorgverlener" select="gds801:NaamZorgverlener"/>
			</xsl:call-template>
			<!-- VC074: Indien Zorgaanbiedercode voorkomt, dan moet ZorgaanbiederSoort voorkomen. -->
			<xsl:call-template name="rc9444a">
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
			</xsl:call-template>
			<!-- VC076: Indien Zorgaanbiedercode niet voorkomt, dan mag ZorgaanbiederSoort niet voorkomen. -->
			<xsl:call-template name="rc9444b">
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSoort" select="gds801:ZorgaanbiederSoort"/>
			</xsl:call-template>
			<!-- VC078: Indien ZorgaanbiederSpecificatie voorkomt, dan mag Zorgaanbiedercode niet voorkomen. -->
			<xsl:call-template name="rc9448">
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
			</xsl:call-template>
			<!-- VC080: Indien PrestatieCodelijstCode = 071 (= Prestatiecodelijst geestelijke gezondheidszorg en forensische zorg volgens ZPM) en ZorgaanbiederSpecificatie voorkomt, dan moet NaamZorgverlener voorkomen. -->
			<xsl:call-template name="rc9450">
				<xsl:with-param name="PrestatieCodelijstCode" select="../../../gds801:PrestatieCodelijstCode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
				<xsl:with-param name="NaamZorgverlener" select="gds801:NaamZorgverlener"/>
			</xsl:call-template>
			<!-- VC085: Indien Berichtcode = 573, dan moet Zorgaanbiedercode of ZorgaanbiederSpecificatie voorkomen. -->
			<xsl:call-template name="rc9455">
				<xsl:with-param name="Berichtcode" select="$Berichtcode"/>
				<xsl:with-param name="Zorgaanbiedercode" select="gds801:Zorgaanbiedercode"/>
				<xsl:with-param name="ZorgaanbiederSpecificatie" select="gds801:ZorgaanbiederSpecificatie"/>
			</xsl:call-template>
		</gds802:Diagnosesteller>
	</xsl:template>
	
	<xsl:template match="gds801:Zorgtraject">
		<gds802:Zorgtraject>
			<!-- controles klasse Zorgtraject uitvoeren -->
			<!-- VC049: Indien ZorgtrajectStartdatum voorkomt, dan moet de waarde van ZorgtrajectStartdatum kleiner zijn dan of gelijk zijn aan de waarde van DebetPrestatie Begindatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:ZorgtrajectStartdatum"/>
				<xsl:with-param name="Peildatum" select="../../gds801:Begindatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9290'"/>
			</xsl:call-template>
		</gds802:Zorgtraject>
	</xsl:template>
	
	<xsl:template match="gds801:Plaatsingsbesluit">
		<gds802:Plaatsingsbesluit>
			<!-- controles klasse Plaatsingsbesluit uitvoeren -->
			<!-- VC054: De waarde van BegindatumForensischeZorgtitel moet kleiner zijn dan of gelijk zijn aan de waarde van Verzenddatum. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:BegindatumForensischeZorgtitel"/>
				<xsl:with-param name="Peildatum" select="$Verzenddatum"/>
				<xsl:with-param name="Vergelijking" select="'kleinerofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9295'"/>
			</xsl:call-template>
			<!-- VC055: Indien EinddatumForensischeZorgtitel voorkomt, dan moet de waarde van BegindatumForensischeZorgtitel kleiner zijn dan of gelijk zijn aan de waarde van EinddatumForensischeZorgtitel. -->
			<xsl:call-template name="rcDatum_vs_Peildatum">
				<xsl:with-param name="TeControlerenDatum" select="gds801:EinddatumForensischeZorgtitel"/>
				<xsl:with-param name="Peildatum" select="gds801:BegindatumForensischeZorgtitel"/>
				<xsl:with-param name="Vergelijking" select="'groterofgelijkaan'"/>
				<xsl:with-param name="Retourcode" select="'9169'"/>
			</xsl:call-template>
		</gds802:Plaatsingsbesluit>
	</xsl:template>
	
	<!-- Copy template: als een enkel element voorkomt, wordt deze gekopieerd in de opgegeven namespace -->
	<xsl:template match="*[namespace-uri()='http://ei.vektis.nl/declaratiebericht573']" mode="copy-if-exists">
		<xsl:if test=".">
			<xsl:element name="{concat('gds802:',local-name())}">
				<xsl:value-of select="text()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
