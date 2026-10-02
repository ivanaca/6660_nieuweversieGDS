<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9802.xslt, nov 2025 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">
	<!-- VC180: Indien OntvangerRol niet = 2 (= Servicebureau), dan mag Debiteur niet voorkomen.
		 retourcode 9802: Debiteur mag niet voorkomen. -->
	<xsl:template name="rc9802">
		<xsl:param name="OntvangerRol"/>
		<xsl:param name="Debiteur"/>
		<xsl:if test="not($OntvangerRol='2') and $Debiteur">
			<gds802:Feedback>
				<gds802:Retourcode>9802</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>
						<xsl:value-of select="local-name($OntvangerRol)"/>
					</gds802:Elementnaam>
					<gds802:Elementwaarde>
						<xsl:value-of select="$OntvangerRol"/>
					</gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>