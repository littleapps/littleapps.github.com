xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.each do|res|
    if res.ext == '.html'
      xml.url do
        xml.loc "http://littleapps.jp#{ res.url }"
        xml.lastmod Time.now.utc.iso8601
        xml.changefreq "monthly"
        xml.priority "0.5"
      end
    end
  end
end
