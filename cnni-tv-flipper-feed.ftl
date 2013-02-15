<@compress single_line=false>
<@include path="/cnn/global/cfg/functions/formatDate.json" />
<#assign currenttime = now()>

<#if content.bins?has_content>

	<?xml version="1.0" encoding="utf-8"?>
	<rss version="2.0">
		<channel>
			<title>${content.sectionDisplayName}</title>
			<link>http://edition.cnn.com/</link>
			<description>CNN.com delivers up-to-the-minute news and information on the latest top stories, weather, entertainment, politics and more.</description>
			<language>en-US</language>
			<copyright>Copyright ${formatDate(currenttime,"yyyy","America/New_York")} Cable News Network LP, LLLP.</copyright>
			<pubDate>${formatDateStr(content.publishDate,"E, dd MMM yyyy HH:mm:ss z","America/New_York")}</pubDate>
			<ttl>10</ttl>
			<image>
				<title>${content.sectionDisplayName}</title>
				<link>http://edition.cnn.com/</link>
				<url>@chromecdn@/.e/img/1.0/logo/cnn.logo.rss.gif</url>
				<width>144</width>
				<height>33</height>
				<description>CNN.com delivers up-to-the-minute news and information on the latest top stories, weather, entertainment, politics and more.</description>
			</image>

			<#assign sections = displayOrder>
			<#list sections as section>
					
					<#assign count=0>
					
						<#assign displaycount=sectionMap["${section}"].displaycount?number>
						<#assign domain=sectionMap["${section}"].domain>
						<#assign qs=sectionMap["${section}"].querystring>
						<#assign category=sectionMap["${section}"].category>
						<#assign url=sectionMap["${section}"].url>
						
						<#list content.bins["${section}"] as data>
						
							<#if count = displaycount><#break></#if>
							<#assign count=count+1>
							<#assign _uri = (data.uri)!"">	
							<#assign _url = (data.url)!"">	
							
							<item>
								<title>${(data.headline!"")?xml}</title>
								<#if _uri =="" && _url=="">
									<guid>${url}</guid>
									<link>${url}</link>
								<#elseif _url !="">
									<guid>${_url}</guid>
									<link>${_url}</link>
								<#else>
									<guid>http://${domain}${_uri}</guid>
									<link>http://${domain}${_uri}</link>
								</#if>								
								<description/>
								<author/>
								<category>${(category!"")}</category>
								<pubDate>${formatDateStr(data.lastModifiedDate,"E, dd MMM yyyy HH:mm:ss z","America/New_York")}</pubDate>
							</item>
							
						</#list>
					
			</#list>
	
	
		</channel>
	</rss>
	
		
</#if>

</@compress>





