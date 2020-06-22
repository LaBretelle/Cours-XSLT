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
    <!-- <xsl:template match="TEI">
        <xsl:copy>
            <xsl:copy-of select="teiHeader"/>
            <xsl:copy-of select="text"/>
        </xsl:copy>
    </xsl:template> les lignes d'en haut peuvent s'écrire comme ça aussi -->
    <xsl:template match="text">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="body">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="lg">
        <xsl:copy>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="l">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <!--  <xsl:template match="app">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="lem">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
      <xsl:template match="rdg">
        <xsl:choose>
            <xsl:when test="contains(@wit, '#Z')">
                <xsl:element name="rdg">
                    <xsl:attribute name="wit">
                        <xsl:value-of select="@wit"/>
                         c'est du Xpath "@wit", ça peut aussi s'écrire ./@wit. La racine de ce wit par du rdg du match au dessus 
                    </xsl:attribute>
                    <xsl:attribute name="type">main</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="rdg">
                    <xsl:attribute name="wit">
                        <xsl:value-of select="@wit"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">sub</xsl:attribute>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> -->
    <xsl:template match="app">
        <app>
            <xsl:copy-of select="lem"/>
            <xsl:for-each select="rdg[contains(@wit, '#Z')]">
                <rdgGrp>
                    <xsl:attribute name="type">main</xsl:attribute>
                    <xsl:element name="rdg">
                        <xsl:attribute name="wit">
                            <xsl:value-of select="@wit"/>
                        </xsl:attribute>
                        <xsl:copy-of select="text()"/>
                    </xsl:element>
                </rdgGrp>
            </xsl:for-each>
            <xsl:for-each select="rdg[not(contains(@wit, '#Z'))]">
                <rdgGrp>
                    <xsl:attribute name="type">sub</xsl:attribute>
                    <xsl:element name="rdg">
                        <xsl:attribute name="wit">
                            <xsl:value-of select="@wit"/>
                        </xsl:attribute>
                        <xsl:copy-of select="text()"/>
                    </xsl:element>
                </rdgGrp>
            </xsl:for-each>
        </app>


    </xsl:template>
</xsl:stylesheet>
