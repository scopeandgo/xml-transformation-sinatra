<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<!-- Skip thinking and final_thoughts sections -->
<xsl:template match="thinking|final_thoughts"/>

<!-- Main template -->
<xsl:template match="/users_and_goals">
    <h2><span style="font-family: 'Lexend'; font-weight: 700;">Primary Goals</span></h2>
    <xsl:apply-templates select="user"/>
</xsl:template>

<!-- Template for each user section -->
<xsl:template match="user">
    <p style="padding-top: 1rem; padding-bottom: 1rem; font-family: 'Lexend'; font-weight: 400;">
        <strong><xsl:value-of select="name"/></strong>
        <xsl:text> — </xsl:text>
        <span class="goal"><xsl:value-of select="primary_goal"/></span>
    </p>
    <p></p>
</xsl:template>

</xsl:stylesheet>
