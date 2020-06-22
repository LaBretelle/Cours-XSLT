<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="text">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="body">
        <xsl:element name="head">
            <xsl:value-of select="upper-case(head)"/>
            <!-- Cette syntaxe permet de mettre en caps lock ou de le retirer -->
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="div">
        <lg type="orig">
            <xsl:apply-templates mode="orig"/>
        </lg>
        <lg type="norm">
            <xsl:apply-templates mode="reg"/>
        </lg>
    </xsl:template>
    <xsl:template match="l" mode="orig">
        <l>
            <xsl:value-of select="text()|.//orig/text()|.//abbr/text()"/>
        </l>
    </xsl:template>
    <xsl:template match="l" mode="reg">
        <l>
            <xsl:value-of select="text()|.//reg/text()|.//expan/text()"/>
        </l>
    </xsl:template>
</xsl:stylesheet>
