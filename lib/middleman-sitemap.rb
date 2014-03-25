# Require core library
require 'middleman-core'

require 'middleman-sitemap/commands'

::Middleman::Extensions.register(:sitemap) do
  require 'middleman-sitemap/extension'
  Sitemap
end
