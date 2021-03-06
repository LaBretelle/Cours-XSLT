<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- Attention une sortie HTML => exclusion du préfixe tei des résultats -->

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <!-- pour éviter les espaces non voulus -->
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="//body/head"/>
                </h1>
                <span>
                    <ul>
                        <xsl:apply-templates select="//listPerson/person"/>
                    </ul>
                </span>
                <span>
                    <a href="{//pb/@facs}">lien vers le manuscrit</a>
                </span>
                <div>
                    <h2>Transcription facsimilaire</h2>
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="orig"/>
                        </ul>
                    </div>
                </div>
                <div>
                    <h2>Transcription normalisée</h2>
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="reg"/>
                        </ul>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="l" mode="#all">
        <xsl:element name="li">
            <xsl:attribute name="n">
                <xsl:number count="." format="1"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="choice" mode="orig">
        <xsl:value-of select="
                .//orig/text() |
                .//abbr/text()"/>
    </xsl:template>

    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="
                .//reg/text() |
                .//expan//text()"/>
    </xsl:template>

    <xsl:template match="person">
        <xsl:variable name="idPerson">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <li>
            <xsl:value-of select="concat(persName, ' : ')"/>
            <xsl:for-each select="ancestor::TEI/body/persName[replace(@ref, '#', '')=$idPerson]">
                <xsl:value-of select="text() | .//reg/text() | .//expan//text()"/> <!-- équivalent de l'apply template mode reg
                <xsl:apply-templates mode="reg"/> -->
                <xsl:text>(v.</xsl:text>
                <xsl:value-of select="count(parent::l/preceding-sibling::l)+1"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position()!=last()">,</xsl:if>
                <xsl:if test="position() = last()">.</xsl:if>
            </xsl:for-each>
        </li>

    </xsl:template>

</xsl:stylesheet>
