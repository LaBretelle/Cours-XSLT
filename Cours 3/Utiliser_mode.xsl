<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">


    <!-- Comment faire pour avoir deux sorties de texte différentes grace à "mode" -->
    <xsl:template match="lg">
        <lg type="orig">
            <xsl:apply-templates mode="orig"/>
        </lg>
        <lg type="norm">
            <xsl:apply-templates mode="norm"/>
        </lg>
    </xsl:template>

    <!-- Et maintenant, c'est les règles suivantes qui s'appliqueront dans chaque -->
    <xsl:template match="l" mode="norm">
        <l>
            <xsl:value-of select="text()|.//expan/text()"/>
        </l>
    </xsl:template>
</xsl:stylesheet>
