<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Match the root element and start building the HTML table -->
  <xsl:template match="/rows">
    <html>
      <head>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <table>
          <!-- Create table headers dynamically based on the first row -->
          <tr>
            <xsl:for-each select="row[1]/*">
              <th><xsl:value-of select="local-name()"/></th>
            </xsl:for-each>
          </tr>
          <!-- Create table rows and cells dynamically -->
          <xsl:apply-templates select="row"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Match each row and create a table row with table data cells -->
  <xsl:template match="row">
    <tr>
      <xsl:for-each select="*">
        <td><xsl:value-of select="."/></td>
      </xsl:for-each>
    </tr>
  </xsl:template>

</xsl:stylesheet>