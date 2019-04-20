<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		>

  <xsl:strip-space elements="*"/>

  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
  
  <!--
    By default, each line is terminated with a Windows newline, but you
    can customize this to produce Macintosh or Unix-style newlines.
  -->
  <!-- <xsl:param name="newline" select="'&#x0D;&#x0A;'"/> -->
	  <xsl:param name="newline" select="'&#x0A;'"/>
  
  <xsl:template match="/">
    <opml version="1.0">
      <head>
		<title>MyLifeOrganized XML</title>				
		</head>
      <body>
		<xsl:apply-templates/>
		</body>
    </opml>
  </xsl:template>

  <xsl:template match="TaskNode">
    <outline>
      <xsl:attribute name="text">
			<xsl:value-of select="@Caption"/>
      </xsl:attribute>

	  <xsl:if test="TextTag">
		<xsl:attribute name="TextTag">
	  		<xsl:value-of select="TextTag"/>
		</xsl:attribute>
      </xsl:if>
	  
	  <xsl:if test="Note">
		<xsl:attribute name="_note">
	  		<xsl:value-of select="Note"/>
		</xsl:attribute>
      </xsl:if>

	  <xsl:if test="TheGoal">
		<xsl:attribute name="TheGoal">
	  		<xsl:value-of select="TheGoal"/>
		</xsl:attribute>
      </xsl:if>
	  
	  <xsl:if test="IsProject">
		<xsl:attribute name="IsProject">
	  		<xsl:value-of select="IsProject"/>
		</xsl:attribute>
      </xsl:if>

	  <xsl:if test="ProjectStatus">
		<xsl:attribute name="ProjectStatus">
	  		<xsl:value-of select="ProjectStatus"/>
		</xsl:attribute>
      </xsl:if>

	  <xsl:if test="Places">
		<xsl:attribute name="category">
			<xsl:for-each select = "Places/Place">				
				<xsl:value-of select="concat('/',.)" />  
			</xsl:for-each>
		</xsl:attribute>
      </xsl:if>
	  
	  <xsl:if test="Flag">
		<xsl:attribute name="Flag">
	  		<xsl:value-of select="Flag"/>
		</xsl:attribute>
      </xsl:if>

	  <xsl:if test="DueDateTime">
		<xsl:attribute name="DueDateTime">
	  		<xsl:value-of select="DueDateTime"/>
		</xsl:attribute>
      </xsl:if>

	  <xsl:if test="StartDateTime">
		<xsl:attribute name="StartDateTime">
	  		<xsl:value-of select="StartDateTime"/>
		</xsl:attribute>
      </xsl:if>
	  
	  <xsl:if test="StarToggleDateTime">
		<xsl:attribute name="StarToggleDateTime">
	  		<xsl:value-of select="StarToggleDateTime"/>
		</xsl:attribute>
      </xsl:if>	  

	  <xsl:if test="Starred">
		<xsl:attribute name="Starred">
	  		<xsl:value-of select="Starred"/>
		</xsl:attribute>
      </xsl:if>

<!-- The field IDD is exported to MLO XML only if there are tasks dependent on this task	 -->  
	  <xsl:if test="IDD">
		<xsl:attribute name="IDD">
	  		<xsl:value-of select="IDD"/>
		</xsl:attribute>
      </xsl:if>	  

	  <xsl:if test="CompleteSubTasksInOrder">
		<xsl:attribute name="CompleteSubTasksInOrder">
	  		<xsl:value-of select="CompleteSubTasksInOrder"/>
		</xsl:attribute>
      </xsl:if>		  

	  <xsl:if test="LeadTime">
		<xsl:attribute name="LeadTime">
	  		<xsl:value-of select="LeadTime"/>
		</xsl:attribute>
      </xsl:if>

	  <xsl:if test="ScheduleType">
		<xsl:attribute name="ScheduleType">
	  		<xsl:value-of select="ScheduleType"/>
		</xsl:attribute>
      </xsl:if>
	  
<!-- MLO XML attribute that are not included in this template:
<Recurrence RecurrenceType> -->
  
      <xsl:apply-templates/>
		</outline>
  </xsl:template>
  
  <xsl:template match="text()"/>  

</xsl:stylesheet>  