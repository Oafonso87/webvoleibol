<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype"/>

<xsl:template match="/club_voleibol">
    
<html lang="es">

<head>
    <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>		
    <meta name="description" content="Página principal"/>
    <title>titulo de la web</title>
</head>

<body>
    <header>
        <img src= "../img/logotipo.png" alt= "Reservas"/>
        <a href="tienda.xml">Tienda</a>
        <a href="equipos.xml">Equipos</a>
        <a href="partidos.xml">Partidos</a>
    </header>
    
    <main>
        <h1>PARTIDOS</h1>
        <table>
            <tr>
                <th>PARTIDO</th>
                <th>FECHA</th>
                <th>RESULTADO</th>
            </tr>
            <xsl:apply-templates select="partido[lugar/@ciudad='Lima']">
                <xsl:sort select="fecha" order="descending"/>
            </xsl:apply-templates>				
        </table>			
    </main>

    <footer>
        <address>&#169; Desarrollado por info@birt.eus</address>
    </footer>
</body>

</html>

</xsl:template>

<xsl:template match="partido">
    <tr>
        <td>
            <xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/>
        </td>
        <td>
            <xsl:value-of select="fecha"/>
        </td>
        <td>
            <xsl:apply-templates select="equipos"/>
        </td>        
    </tr>
</xsl:template>

<xsl:template match="equipos">
    <xsl:variable name="ganador" select="visitante/@puntuacion > local/@puntuacion"/>    
        <xsl:choose>
            <xsl:when test="$ganador">
                <span class="azul"><xsl:value-of select="concat(local/@puntuacion, ' - ', visitante/@puntuacion)"/></span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(local/@puntuacion, ' - ', visitante/@puntuacion)"/>
            </xsl:otherwise>
        </xsl:choose>    
</xsl:template>

</xsl:stylesheet>