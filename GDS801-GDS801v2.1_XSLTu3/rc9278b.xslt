<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9278b.xslt, 8 juli 2021 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9278: Indien TariefInclBtw > 0.00, of BerekendBedragInclBtw > 0.00 of DeclaratieBedragInclBtw > 0.00, dan moet TariefInclBtw > 0.00 en BerekendBedragInclBtw > 0.00 en DeclaratieBedragInclBtw > 0.00. -->
	<xsl:template name="rc9278b">
		<xsl:param name="TariefInclBtw"/>
		<xsl:param name="BerekendBedragInclBtw"/>
		<xsl:param name="DeclaratieBedragInclBtw"/>
		
		<xsl:if test="(($TariefInclBtw &gt; 0) or ($BerekendBedragInclBtw &gt; 0) or ($DeclaratieBedragInclBtw &gt; 0)) and not(($TariefInclBtw &gt; 0) and ($BerekendBedragInclBtw &gt; 0) and ($DeclaratieBedragInclBtw &gt; 0))">
			<gds802:Feedback>
				<gds802:Retourcode>9278</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($TariefInclBtw)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$TariefInclBtw"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($BerekendBedragInclBtw)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$BerekendBedragInclBtw"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($DeclaratieBedragInclBtw)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$DeclaratieBedragInclBtw"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
