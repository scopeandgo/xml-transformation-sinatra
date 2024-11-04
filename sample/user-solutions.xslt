<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <!-- Template for the root element -->
    <xsl:template match="/">
        <xsl:apply-templates select="//solution_for_users"/>
    </xsl:template>

    <!-- Template for solution_for_users section -->
    <xsl:template match="solution_for_users">
        <xsl:apply-templates select="user"/>
    </xsl:template>

    <!-- Template for user -->
    <xsl:template match="user">
        <h2 style="padding-top: 1rem; padding-bottom: 1rem; page-break-after: avoid; text-align:left;"><span style="font-family: 'Lexend'; font-size: 1.5rem; font-weight: 400;"><xsl:value-of select="."/> solutions</span></h2>
        <xsl:apply-templates select="following-sibling::solution[1]"/>
    </xsl:template>

    <!-- Template for solution section -->
    <xsl:template match="solution">
        <p style="font-family: 'Lexend';"><xsl:value-of select="intro"/></p>
        <ul style="font-family: 'Lexend'; margin-top: 1rem; margin-bottom: 1rem;">
            <xsl:apply-templates select="item"/>
        </ul>
        <p style="font-family: 'Lexend';"><xsl:value-of select="outro"/></p>
    </xsl:template>

    <!-- Template for item -->
    <xsl:template match="item">
        <li style="font-family: 'Lexend';"><xsl:value-of select="."/></li>
    </xsl:template>

</xsl:stylesheet>
