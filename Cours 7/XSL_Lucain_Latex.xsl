<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <!-- vaut aussi match="TEI", c'est même mieux --> \documentclass[12pt, a4paper]{report} ﻿
        \usepackage[utf8x]{inputenc} \usepackage[T1]{fontenc} \usepackage{lmodern}
        \usepackage{graphicx} \usepackage[french]{babel} \usepackage{reledmac}
        \setstanzaindents{0,1} \setcounter{stanzaindentsrepetition}{1} \Xarrangement[A]{paragraph}
        \Xparafootsep{$\parallel$~} \begin{document} \firstlinenum{5} \linenumincrement{5}
        \linenummargin{right} \setline{183} \beginnumbering \stanza <xsl:apply-templates
            select="//lg"/> \endnumbering \end{document} </xsl:template>

    <xsl:template match="lg">
        <xsl:value-of select="./text()"/>
        <xsl:apply-templates/>
        <xsl:text> &amp;  &#10;</xsl:text>
        <xsl:text>
            \&amp; 
        </xsl:text>
    </xsl:template>
    <xsl:template match="app">
        <xsl:text>\edtext{
                    </xsl:text>
        <xsl:value-of select=".//lem/text()"/>
        <xsl:text>}{/Afootnote{</xsl:text>
        <xsl:for-each select="rdg">
            <xsl:choose>
                <xsl:when test="count(text()) = 0">
                    <xsl:text>\textit{omisit},</xsl:text>
                    <xsl:value-of select="replace(@wit, '#', '')"/>
                    <xsl:text>}{</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'rasura'">
                    <xsl:text>\textit{rasura},</xsl:text>
                    <xsl:value-of select="replace(@wit, '#', '')"/>
                    <xsl:text>}{</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select=".//lem/text()"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="replace(@wit, '#', '')"/>
                    <xsl:if test="count(.) != 1">
                        <xsl:text>}{</xsl:text>
                    </xsl:if>
                </xsl:otherwise>

            </xsl:choose>
        </xsl:for-each>
        <xsl:text>}}</xsl:text>
    </xsl:template>
    <!-- 
    <xsl:template match="lg">
        <xsl:for-each select="l">
            <xsl:value-of select="./text() | .//lem/text()"/>
            <xsl:for-each select="app">
                <xsl:if test="lem">
                    <xsl:text>\edtext{</xsl:text>
                    <xsl:value-of select=".//lem/text()"/>
                    <xsl:text>}{/Afootnote{</xsl:text>
                </xsl:if>
                <xsl:if test="count(rdg) = 1">
                    <xsl:value-of select="rdg/text()"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="replace(./rdg/@wit, '#', '')"/>
                    <xsl:text>}</xsl:text>
                </xsl:if>
                <xsl:if test="count(rdg) != 1">
                    <xsl:for-each select="rdg">
                        <xsl:value-of select="rdg/text()"/>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="replace(./rdg/@wit, '#', '')"/>
                        <xsl:text>}{</xsl:text>
                    </xsl:for-each>
                    <xsl:text>}</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text> &amp;  &#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>
            \&amp; 
        </xsl:text>
    </xsl:template>  -->
</xsl:stylesheet>
