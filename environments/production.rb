configure :production do
  # Minify errythang
  activate :minify_css, inline: true
  activate :minify_html
  activate :minify_javascript, inline: true

  # Add unique fingerprint to each compiled asset
  activate :asset_hash

  # Enable cache buster
  activate :cache_buster

  # GZIP errythang
  activate :gzip

  # Robots.txt
  activate :robots,
  rules: [
    {
      user_agent: '*',
      allow:      %w(/),
    }
  ],
  sitemap: "#{config[:host]}/sitemap.xml"

  # Ping the search engines upon build
  activate :sitemap_ping do |config|
    config.host         = ENV['SITE_URL']
    config.sitemap_file = 'sitemap.xml'
    config.ping_google  = true
    config.ping_bing    = true
    config.after_build  = true
  end
end
