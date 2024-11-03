<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <!-- Template for the root element -->
    <xsl:template match="/">
        <xsl:apply-templates select="//solution_for_users"/>
    </xsl:template>

    <!-- Template for solution_for_users section -->
    <xsl:template match="solution_for_users">
        <h3>Solutions</h3>
        <xsl:apply-templates select="user"/>
    </xsl:template>

    <!-- Template for user -->
    <xsl:template match="user">
        <h3><xsl:value-of select="."/> solutions</h3>
        <xsl:apply-templates select="following-sibling::solution[1]"/>
    </xsl:template>

    <!-- Template for solution section -->
    <xsl:template match="solution">
        <p><xsl:value-of select="intro"/></p>
        <ul>
            <xsl:apply-templates select="item"/>
        </ul>
        <p><xsl:value-of select="outro"/></p>
    </xsl:template>

    <!-- Template for item -->
    <xsl:template match="item">
        <li><xsl:value-of select="."/></li>
    </xsl:template>

</xsl:stylesheet>
