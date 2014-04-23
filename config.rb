Dotenv.load

Time.zone = "Tokyo"

activate :directory_indexes
activate :i18n, langs: [:en, :ja], :mount_at_root => :en
activate :livereload

page "/sitemap.xml", layout: false
page "/404.html",    directory_index: false
page "/y_key_eeab6a97b2faf124.html", directory_index: false, layout: false
page "/googled8d3144649a51e05.html", directory_index: false, layout: false

require 'slim'
require 'sass'
require 'coffee-script'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

compass_config do |config|
  config.output_style = :compact
end

ready do
  sprockets.append_path '/lib/javascripts/'
  sprockets.append_path '/lib/stylesheets/'
  sprockets.append_path '/source/stylesheets/partials/'
end

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-XXXXXX-YY'
  end
end

activate :ogp do |ogp|
  ogp.namespaces = {
    fb: data.ogp.fb,
    og: data.ogp.og
  }
  ogp.blog = true
  ogp.base_url = "http://littleapps.jp/"
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash, ignore: 'images'
  ignore '.DS_Store'
  ignore '.*.swp'
  ignore 'stylesheets/partials'
  ignore '_drafts'
  activate :favicon_maker, :icons => {
    "favicon-hires.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-144x144-precomposed.png" },
      { icon: "apple-touch-icon-120x120-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-76x76-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "apple-touch-icon-60x60-precomposed.png" },
      { icon: "apple-touch-icon-57x57-precomposed.png" },
      { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
      { icon: "apple-touch-icon.png", size: "57x57" },
      { icon: "favicon-196x196.png" },
      { icon: "favicon-160x160.png" },
      { icon: "favicon-96x96.png" },
      { icon: "mstile-144x144", format: "png" }
    ],
    "favicon-lores.png" => [
      { icon: "favicon-32x32.png" },
      { icon: "favicon-16x16.png" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }
    ]
  }
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-200187-25'
  end
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.remote = "https://#{ENV['GH_TOKEN']}@github.com/littleapps/littleapps.github.com.git"
end

helpers do

  def en?
    I18n.locale = current_resource.data.locale if current_resource.data.locale
    I18n.locale.to_s == 'en'
  end

  def lang
    en? ? 'en_US' : 'ja_JP'
  end


  def base_path
    en? ? "/" : "/ja/"
  end

  def alt_lang
    en? ? "ja_JP" : "en_US"
  end

  def alt_lang_name
    en? ? "日本語" : "English"
  end

  def alt_base
    I18n.locale.to_s == 'en' ? "littleapps.jp/ja" : "littleapps.jp"
  end

  def alt_href
    "http://#{alt_base}#{current_resource.url.sub(%r{^/ja/}, '/')}"
  end

end
