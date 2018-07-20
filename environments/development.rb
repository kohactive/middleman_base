configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload

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
