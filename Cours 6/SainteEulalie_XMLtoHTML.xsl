<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes"/>
    <!-- préambule fait pour sortir du html -->
    <xsl:template match="head">
        <h1>
            <xsl:value-of select="./text()"/>
        </h1>
    </xsl:template>
    <xsl:template match="pb">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body">
        <html>
            <xsl:apply-templates select="head"/>
            <xsl:apply-templates select="pb"/>
            <xsl:element name="div">
                <ul>
                    <xsl:apply-templates mode="orig"/>
                </ul>
            </xsl:element>
            <xsl:element name="div">
                <ul>
                    <xsl:apply-templates mode="norm"/>
                </ul>
            </xsl:element>
        </html>
    </xsl:template>

    <xsl:template match="l" mode="orig">
        <li>
            <xsl:value-of select="text() | .//orig/text()"/>
            <xsl:attribute name="n">
                <xsl:number count="l" level="multiple" format="1"/>
            </xsl:attribute>
        </li>
    </xsl:template>
    <xsl:template match="l" mode="norm">
        <li>
            <xsl:value-of select="text() | .//reg/text()"/>
        </li>
    </xsl:template>



</xsl:stylesheet>
