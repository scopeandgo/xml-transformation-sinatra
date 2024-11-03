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
        <h4><xsl:value-of select="."/> problems</h4>
        <xsl:apply-templates select="following-sibling::problem[1]"/>
    </xsl:template>

    <!-- Template for problem -->
    <xsl:template match="problem">
        <p><xsl:value-of select="."/></p>
    </xsl:template>

</xsl:stylesheet>
