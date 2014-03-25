# Require core library
require 'middleman-core'

::Middleman::Extensions.register(:sitemap) do
  require 'middleman-sitemap/extension'
  Sitemap
end
