xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.each do|res|
    if res.source_file.end_with?('.slim') && res.url != '/404.html'
      xml.url do
        xml.loc "http://littleapps.jp#{ res.url }"
        xml.lastmod Time.now.utc.iso8601
        xml.changefreq "monthly"
        case res.url
        when '/'
          xml.priority "1.0"
        when '/ja/'
          xml.priority "0.8"
        else
          xml.priority "0.5"
        end
      end
    end
  end
end
