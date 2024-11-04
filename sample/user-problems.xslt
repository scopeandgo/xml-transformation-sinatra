<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <!-- Template for the root element -->
    <xsl:template match="/">
        <xsl:apply-templates select="//problem_for_users"/>
    </xsl:template>

    <!-- Template for problem_for_users section -->
    <xsl:template match="problem_for_users">
        <xsl:apply-templates select="user"/>
    </xsl:template>

    <!-- Template for user -->
    <xsl:template match="user">
        <h2 style="padding-top: 1rem; padding-bottom: 1rem; page-break-after: avoid; text-align:left;"><span style="font-family: 'Lexend'; font-size: 1.5rem; font-weight: 400;"><xsl:value-of select="."/> problems</span></h2>
        <xsl:apply-templates select="following-sibling::problem[1]"/>
    </xsl:template>

    <!-- Template for problem -->
    <xsl:template match="problem">
        <p style="font-family: 'Lexend'; line-height:1.15; page-break-after: avoid;"><xsl:value-of select="."/></p>
    </xsl:template>

</xsl:stylesheet>
