<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<!-- Skip thinking and final_thoughts sections -->
<xsl:template match="thinking|final_thoughts"/>

<!-- Main template -->
<xsl:template match="/root">
    <ul>
        <xsl:apply-templates select="user"/>
    </ul>
</xsl:template>

<!-- Template for each user section -->
<xsl:template match="user">
    <li>
        <strong><xsl:value-of select="name"/></strong>
        <xsl:text> — </xsl:text>
        <span class="goal"><xsl:value-of select="primary_goal"/></span>
    </li>
</xsl:template>

</xsl:stylesheet>
