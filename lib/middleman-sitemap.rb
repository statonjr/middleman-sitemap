# Require core library
require 'middleman-core'

# Extension namespace
class Sitemap < ::Middleman::Extension
  option :gzip, true, 'Whether or not to GZIP the resulting file'
  option :hostname, "http://www.example.com", "The hostname for your website"

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_build
    require 'erb'
    @pages = app.sitemap.resources.find_all{ |p| p.source_file.match(/\.html/) }
    @hostname = options.hostname
    template = Tilt::ERBTemplate.new(File.expand_path(File.join("#{File.dirname(__FILE__)}", "../templates/sitemap.xml.erb")))
    sitemap = template.render(self)
    outfile = File.join(app.build_dir, "sitemap.xml")
    File.open(outfile, 'w') {|f| f.write(sitemap) }
    if options.gzip
      gzip_file(File.read(outfile))
    end
  end

  def gzip_file(sitemap)
    require 'zlib'
    File.open(File.join(@app.build_dir, "sitemap.xml.gz"), 'wb') do |f|
      gz = Zlib::GzipWriter.new(f, Zlib::BEST_COMPRESSION)
      gz.write sitemap
      gz.close
    end
  end

end

::Middleman::Extensions.register(:sitemap, Sitemap)
