<?xml version="1.0" encoding="UTF-8"?>
<!-- rcDatum_vs_Peildatum.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- deze routine voert de volgende controle uit: 
		 	- als TeControlerenDatum een waarde bevat
				- controleer TeControlerenDatum met de gevraagde Vergelijking ten opzichte van Peildatum, als TeControlerenDatum niet correct is, dan wordt Retourcode geretourneerd. -->
					
	<xsl:template name="rcDatum_vs_Peildatum">
		<xsl:param name="TeControlerenDatum"/>
		<xsl:param name="Peildatum"/>
		<xsl:param name="Vergelijking"/>
		<xsl:param name="Retourcode"/>
		
		<xsl:if test="$TeControlerenDatum != ''">
			<xsl:if test="($Vergelijking = 'kleinerofgelijkaan') and (normalize-space(translate($TeControlerenDatum,'-','')) &gt; normalize-space(translate($Peildatum,'-',''))) or
								($Vergelijking = 'groterofgelijkaan') and (normalize-space(translate($TeControlerenDatum,'-','')) &lt; normalize-space(translate($Peildatum,'-',''))) or
								($Vergelijking = 'groterdan') and not(normalize-space(translate($TeControlerenDatum,'-','')) &gt; normalize-space(translate($Peildatum,'-',''))) or
								($Vergelijking = 'gelijkaan') and not(normalize-space(translate($TeControlerenDatum,'-','')) = normalize-space(translate($Peildatum,'-','')))">
				<gds802:Feedback>
					<gds802:Retourcode><xsl:value-of select="$Retourcode"/></gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TeControlerenDatum)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TeControlerenDatum"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($Peildatum)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$Peildatum"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				</gds802:Feedback>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
