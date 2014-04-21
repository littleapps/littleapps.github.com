xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  site_url = t 'blog.url'
  xml.url do
    xml.loc site_url
    xml.lastmod blog.articles.first.date.to_time.iso8601
    xml.changefreq "daily"
    xml.priority "1.0"
  end
end
