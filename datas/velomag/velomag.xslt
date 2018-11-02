<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:text>na,lat,long,av,fr,to,cb&#xa;</xsl:text>
        <xsl:for-each select="/vcs/sl/si">
            <xsl:value-of select="@na"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@la"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@lg"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@av"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@fr"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@to"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@cb"/>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
