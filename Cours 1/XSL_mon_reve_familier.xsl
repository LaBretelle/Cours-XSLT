<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <!--  <xsl:template match="/">--> 
        <!-- le "/" désigne qu'on part de la racine du document xml (c'est le début d'un chemin, donc c'est tous les chemins). Là, en gros, les règles énoncées ensuite s'appliqueront à tous les documents depuis la racine -->
    <!--    <xsl:apply-templates/> -->  
        <!-- ce apply templates, avec le xsl template qui l'encadre, dit qu'il faut appliquer aux enfants toutes les règles des parents. Cet apply template impose l'hérédité, qui n'est pas naturelle --> 
    <!--  </xsl:template>  -->
    
    
    <!--  <xsl:template match="text()"><xsl:value-of select="."/></xsl:template>--> 
    <!-- En voyant que rien ne change avec ce nouveau xsl:template, cela veut dire qu'un xsl:template match="/" + un apply templates vide implique automatiquement de récupérer tout le texte des balises enfants, et le présenter tel quel. -->
    
    
    <!-- <xsl:template match="/"><xsl:copy-of select="."></xsl:copy-of></xsl:template> -->
    <!-- là, le copy-of a sorti en TEI directement tous les attributs possibles. Copy of copie donc tous les éléments, mais en ajoutant tout l'implicite. L'XSL prend donc en compte le schéma relié à notre HTML. -->
    
    
    <!-- Pour sélectionner et copier l'élément <lg>: on met le chemin dans l'attribut match de la balise template, dans l'attribut match (on met dedans "tei:lg") -->
    <!-- le "tei:lg" / "tei:l" n'est pas un chemin depuis tei, mais un appel au namespace: en gros, il appelle la balise lg (ou l) de la tei. -->
    <!-- tei:lg[@type='tercet']/tei:l[3]  c'est un chemin intéressant -->
    <!-- <xsl:template match="tei:l[position() &lt;= 3]">--><xsl:template match="(//tei:l)[3]"><xsl:copy-of select="."></xsl:copy-of></xsl:template>
    <!-- un prédicat par comparaison, c'est : tei:l[position() &lt;= 2] ce qui veut dire : je veux tous les vers inférieurs ou égales à la deuxième position -->
    <!-- <xsl:template match="(//tei:l)[3]"> fait sélectionner le vers n°3 du poème uniquement -->
    </xsl:stylesheet> 
    
    
    