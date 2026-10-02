<?xml version="1.0" encoding="UTF-8"?>
<!-- rcDatum_vs_Huidigedatum.xslt, 8 juli 2021-->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- deze routine voert de volgende controle uit: 
		 	- als TeControlerenDatum een waarde bevat
				- controleer TeControlerenDatum met de gevraagde Vergelijking ten opzichte van de huidige datum uit config.xml, als TeControlerenDatum niet correct is, dan wordt Retourcode geretourneerd. -->

	<!-- Laden Configuratiefile	-->
	<xsl:import href="config_Vecozo.xml"/>

				
	<xsl:template name="rcDatum_vs_Huidigedatum">
		<xsl:param name="TeControlerenDatum"/>
		<xsl:param name="Vergelijking"/>
		<xsl:param name="Retourcode"/>
		
		<xsl:if test="($TeControlerenDatum != '')">
			<xsl:if test="($Vergelijking = 'kleinerofgelijkaan') and (normalize-space(translate($TeControlerenDatum,'-','')) &gt; normalize-space(translate($HuidigeDatum,'-','')))">
				<gds802:Feedback>
					<gds802:Retourcode><xsl:value-of select="$Retourcode"/></gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TeControlerenDatum)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TeControlerenDatum"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam>HuidigeDatum</gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$HuidigeDatum"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
