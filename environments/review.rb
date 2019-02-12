configure :review do
  config[:host] = ENV['DEPLOY_PRIME_URL']

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
      disallow:  %w(/),
    }
  ],
  sitemap: "#{config[:host]}/sitemap.xml"
end
