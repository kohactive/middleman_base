require 'active_support/core_ext/string/inflections'

###
# Page options, layouts, aliases and proxies
###


# General configuration
#

# Plugin Activations
#
activate :meta_tags
activate :router
activate :directory_indexes

# Activate webpack
activate :external_pipeline,
  name: :webpack,
  command: build? ? 'npm run build' : 'npm run start',
  source: '.tmp/dist',
  latency: 1

# Asset Locations
#
set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir,  'assets/fonts'

# Build-specific configuration
#
configure :build do
  # You can place any global configs here, but it's preferred
  # that you place environment configs in the appropriate
  # environment file, check ./environments folder.
  config[:host] = ENV['SITE_URL']
end

# After build actions
after_build do |builder|
  src = File.join("_redirects")
  dst = File.join(config[:build_dir],"_redirects")
  builder.thor.source_paths << File.dirname(__FILE__)
  builder.thor.copy_file(src,dst)
end
