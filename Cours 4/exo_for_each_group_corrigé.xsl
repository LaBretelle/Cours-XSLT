<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xml" indent="yes"/>
<!-- On associe ce schéma à triApp.xml -->
<!-- On veut maintenant copier tous les rdg dans des RdgGrp qu'on réunit par leur type -->
    <xsl:template match="app">
        <xsl:copy>
            <!-- avec copy, on veut garder le éléments à l'intérieur -->
            <xsl:for-each-group select="rdg" group-by="@type">
                <!-- le for each group boucle au niveau des noeuds qu'on indique (les rdg) et les regroupe selon ce qu'on indique (ici l'attribut type) -->
                <xsl:sort select="@type"/>
                <!-- Ici, on trie les résultats par ordre alphabétique de l'attribut type -->
                <xsl:element name="rdgGrp">
                    <!-- Ici, on crée l'élément rdgGrp -->
                    <xsl:attribute name="type">
                        <!-- Ici, on crée l'attribut type -->
                        <xsl:value-of select="current-grouping-key()"/>
                        <!-- Là, on attribue à l'attribut la valeur enregistrée durant le bouclage autour de l'attribut @type qu'on a mentionné dans le group by -->
                    </xsl:attribute>
                    <xsl:for-each select="current-group()">
                        <!-- Ici, on crée à nouveau une boucle à l'intérieur du for-each-group pour traiter les différents rdg. En effet,
                        s'il y a plus d'un rdg, il ne l'entrera pas. En fait, le rdgGrp ne rentre que des groupes, et non pas leurs enfants. Il faut donc relancer
                        une boucle pour les éléments internes-->
                        <xsl:element name="rdg">
                            <!-- Ici, on crée un nouvel élément rdg -->
                            <xsl:attribute name="wit">
                                <xsl:value-of select="@wit"/>
                                <!-- Ici, on lui file l'attribut wit d'après le nom des attributs wit des rdg -->
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                            <!-- Ici, on donne à rdg la valeur du rdg -->
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
