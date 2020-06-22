<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">


    <xsl:template match="TEI">
    <xsl:call-template name="index"/>
    <!-- permet d'insérer un template, qu'on décrira plus tard. C'est une balise autofermante. Il faut la mettre au même endroit qu'un apply-templates -->
    </xsl:template>


    <xsl:template name="index">
        <xsl:for-each select="//listPerson//persName">
            <xsl:variable name="idPerson">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <li>
                <xsl:value-of select="concat(persName, ' : ')"/>
                <xsl:for-each
                    select="ancestor::TEI/body/persName[replace(@ref, '#', '') = $idPerson]">
                    <xsl:value-of select="text() | .//reg/text() | .//expan//text()"/>
                    <!-- équivalent de l'apply template mode reg
                <xsl:apply-templates mode="reg"/> -->
                    <xsl:text>(v.</xsl:text>
                    <xsl:value-of select="count(parent::l/preceding-sibling::l) + 1"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">,</xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
