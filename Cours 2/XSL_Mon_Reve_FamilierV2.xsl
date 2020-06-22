<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- toujours rajouter cet xmlns:tei et le xpath default namespace, ainsi que le xmlns seul -->

    <!-- <xsl:template match="lg">
        <p type="{./@type}">Ici il y avait un quatrain<xsl:apply-templates/></p>
    </xsl:template>
    ici, on prend les lg, et on les remplace par des <p> qui prennent l'attribut des anciens lg
    
    ceci vaut autant que :
    <xsl:template match="lg">
        <xsl:element type="p">Ici il y avait un quatrain<xsl:apply-templates/></xsl:element>
    </xsl:template>-->

    <!-- <xsl:template match="lg">
        <xsl:element name="p">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:text>Ici il y avait un groupe de vers.</xsl:text>
        </xsl:element>
    </xsl:template> -->
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
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>

    </xsl:template>
    <xsl:template match="lg">
        <xsl:element name="lg">
            <xsl:attribute name="n">
                <xsl:number count="lg" level="multiple" format="A.a"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!-- Ce schéma permet de numéroter tous les lg du poème. -->
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="multiple" format="1"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!-- <xsl:template match="mon_element_xml">
        <p type="{./chemin_Xpath}">Ici,
            il y avait mon élément</p>
    </xsl:template> 
    Là dedans, il ne faut pas oublier que le chemin Xpath s'exprime entre accolades. Sinon, on affiche directement le nom de l'élément. -->

    <!-- Copy-of copie l'intégralité de l'élément, les attributs et de ses enfants : il copie l'arbre sans qu'on puisse intervenir dessus.
    Copy sélectionne uniquement l'élément, sans rien d'autre. Mais on peut intervenir. -->
</xsl:stylesheet>
