<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="typeFilter" />

    <xsl:template match="/">
        <html>
        <body>
            <h2>Tipos de Carnes de Cerdo</h2>
            <table border="1">
                <tr>
                    <th>Tipo</th>
                    <th>Peso (kg)</th>
                    <th>Precio ($)</th>
                    <th>Descripción</th>
                </tr>
                <xsl:for-each select="data/meat[not($typeFilter) or @type=$typeFilter]">
                    <tr>
                        <td><xsl:value-of select="@type"/></td>
                        <td><xsl:value-of select="@weight"/></td>
                        <td><xsl:value-of select="@price"/></td>
                        <td><xsl:value-of select="description"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <xsl:call-template name="calculateTotals"/>
        </body>
        </html>
    </xsl:template>

    <xsl:template name="calculateTotals">
        <div class="total-container">
            <h2>Totales</h2>
            <p>Peso Total: <xsl:value-of select="sum(data/meat[not($typeFilter) or @type=$typeFilter]/@weight)"/> kg</p>
            <p>Precio Total: $<xsl:value-of select="sum(data/meat[not($typeFilter) or @type=$typeFilter]/@price)"/></p>
        </div>
    </xsl:template>
</xsl:stylesheet>
