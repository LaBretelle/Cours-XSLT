<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="TEI">
        <xsl:copy-of select="teiHeader"/>
        <xsl:copy select="text">
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="body">
        <xsl:element name="body">
            <xsl:attribute name="n">play</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="div">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="div/div">
        <xsl:element name="div">
            <xsl:attribute name="type">Act</xsl:attribute>
            <xsl:attribute name="n">
                <xsl:number count="div/div" level="any" format="I"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="pb | milestone"/>
    <!-- le pipe sert à sélectionner 2 éléments en simultanée. En faisant une règle vide, on supprime l'élément. -->
    <xsl:template match="sp | @*">
        <!-- match="sp | @" force l'ordinateur à récupérer l'élément ET tous les attributs. -->
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <!-- il faut rappeler qu'on récupère TOUS les attributs (avec l' *) -->
        </xsl:copy>
    </xsl:template>
    <xsl:template match="speaker">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="any" format="a"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="name[@type='person']">
        <xsl:element name="persName">
            <xsl:attribute name="ref">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </xsl:element>

    </xsl:template>
</xsl:stylesheet>
