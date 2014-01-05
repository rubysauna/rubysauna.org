# explicitely load helpers so we can use them below
require "helpers/event_helpers"
helpers EventHelpers

# Assets
set :css_dir,     'stylesheets'
set :js_dir,      'javascripts'
set :images_dir,  'images'

# Partials directory
set :partials_dir, 'partials'

# Livereload
activate :livereload

# Pretty URLs
activate :directory_indexes

# Build-specific configuration
configure :build do

  # Compression and minification
  activate :minify_css
  activate :minify_javascript
  activate :gzip

end
