<?xml version="1.0" encoding="UTF-8"?>
<!-- rc9506.xslt, 18 maart 2022 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gds802="http://ei.vektis.nl/declaratiebericht574">

	<!-- retourcode 9506: Indien Zorgaanbieder voorkomt, dan mag alleen Declarant/ZorgaanbiederSoort = 3 (= Zorgverlener) en Zorgaanbieder/ZorgaanbiederSoort = 1 (= Instelling) of 2 (= Praktijk) voorkomen. -->
	<xsl:template name="rc9506">
		<xsl:param name="DeclarantZorgaanbiedersoort"/>
		<xsl:param name="ZorgaanbiederZorgaanbiedersoort"/>
		
		<xsl:if test="($ZorgaanbiederZorgaanbiedersoort !=''
                   and not($DeclarantZorgaanbiedersoort='3' and ($ZorgaanbiederZorgaanbiedersoort = '1' or $ZorgaanbiederZorgaanbiedersoort = '2'))
                          ) ">
			<gds802:Feedback>
				<gds802:Retourcode>9506</gds802:Retourcode>
				<!-- som de elementen op die de fout veroorzaken -->
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($DeclarantZorgaanbiedersoort)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$DeclarantZorgaanbiedersoort"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
				<gds802:BetrokkenElement>
					<gds802:Elementnaam><xsl:value-of select="local-name($ZorgaanbiederZorgaanbiedersoort)"/></gds802:Elementnaam>
					<gds802:Elementwaarde><xsl:value-of select="$ZorgaanbiederZorgaanbiedersoort"/></gds802:Elementwaarde>
				</gds802:BetrokkenElement>
			</gds802:Feedback>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
