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
    <h2 style="page-break-after: avoid; break-after: avoid;"><span style="font-family: 'Lexend'; font-weight: 700;"><xsl:value-of select="name"/> Scope</span></h2>

    <h3 style="page-break-after: avoid; break-after: avoid;"><span style="font-family: 'Lexend'; font-weight: 700;">Musts</span></h3>
    <ul class="must-list">
        <xsl:for-each select="must">
            <li>
                <xsl:value-of select="concat(translate(substring(.,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(.,2))"/>
            </li>
        </xsl:for-each>
    </ul>

    <h3 style="page-break-after: avoid; break-after: avoid;"><span style="font-family: 'Lexend'; font-weight: 700;">Must Nots</span></h3>
    <ul class="mustnot-list">
        <xsl:for-each select="mustnot">
            <li>
                <xsl:value-of select="concat(translate(substring(.,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(.,2))"/>
            </li>
        </xsl:for-each>
    </ul>
</xsl:template>

</xsl:stylesheet>
