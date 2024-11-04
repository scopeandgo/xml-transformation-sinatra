<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<!-- Skip thinking and final_thoughts sections -->
<xsl:template match="thinking|final_thoughts"/>

<!-- Main template -->
<xsl:template match="/user_scopes">
    <xsl:apply-templates select="user"/>
</xsl:template>

<!-- Template for each user section -->
<xsl:template match="user">
    <h3><xsl:value-of select="name"/></h3>

    <h4>Must</h4>
    <ul class="must-list">
        <xsl:for-each select="must">
            <li>
                <xsl:value-of select="concat(translate(substring(.,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(.,2))"/>
            </li>
        </xsl:for-each>
    </ul>

    <h4>Must Not</h4>
    <ul class="mustnot-list">
        <xsl:for-each select="mustnot">
            <li>
                <xsl:value-of select="concat(translate(substring(.,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(.,2))"/>
            </li>
        </xsl:for-each>
    </ul>
</xsl:template>

</xsl:stylesheet>
