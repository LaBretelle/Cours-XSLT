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
        <xsl:copy-of select="."> </xsl:copy-of>
    </xsl:template>
    <!-- le copy-of est à mettre pour copier à l'identique, quand on ne touche pas -->
    <xsl:template match="text">
        <xsl:copy>
            <xsl:element name="body">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="lg[@type = 'sonnet']">
        <xsl:apply-templates select="lg[@type = 'sizain']"/>
        <xsl:apply-templates select="lg[@type = 'quatrain']"/>
    </xsl:template>
    <!-- ci dessus, on inverse la position de deux éléments -->
    <xsl:template match="lg">
        <xsl:copy>
            <xsl:element name="lg">
                <xsl:attribute name="type">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
                <xsl:attribute name="n">
                    <xsl:value-of select="@n"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
