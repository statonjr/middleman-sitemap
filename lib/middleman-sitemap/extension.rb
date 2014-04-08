# Extension namespace
class Sitemap < ::Middleman::Extension
  option :gzip, true, 'Whether or not to GZIP the resulting file'
  option :hostname, "http://www.example.com", "The hostname for your website"

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    require 'erb'

    # set up your extension
    # puts options.my_option
  end

  def after_build(builder)
    @builder = builder
    generate_sitemap
  end

  def generate_sitemap
    pages = app.sitemap.resources.find_all{ |p| p.ext == ".html" }

    if pages.count > 50000
      sitemaps = build_multiple_sitemaps(pages)
    else
      sitemaps = [build_sitemap("sitemap.xml", pages)]
    end

    if options.gzip
      sitemaps.each do |sitemap|
        gzip_file(sitemap)
        @builder.say_status :create, "#{sitemap}.gz" if @builder
      end
    end
  end

  def build_sitemap_index(number_of_sitemaps)
    @hostname = options.hostname
    @sitemaps = number_of_sitemaps
    @ext = options.gzip ? ".xml.gz" : ".xml"
    template = Tilt::ERBTemplate.new(File.expand_path(File.join("#{File.dirname(__FILE__)}", "../../templates/sitemapindex.xml.erb")))
    sitemap = template.render(self)

    outfile = File.join(app.build_dir, "sitemap.xml")
    File.open(outfile, 'w') {|f| f.write(sitemap) }

    @builder.say_status :create, "build/sitemap.xml"

    return "build/sitemap.xml"
  end

  def build_sitemap(name, pages)
    @pages = pages
    @hostname = options.hostname
    templates_path = File.expand_path(File.join("#{File.dirname(__FILE__)}", "../../templates/sitemap.xml.erb"))
    template = Tilt::ERBTemplate.new(templates_path, 0, :trim => '>')
    sitemap = template.render(self)

    outfile = File.join(app.build_dir, name)
    File.open(outfile, 'w') {|f| f.write(sitemap) }

    @builder.say_status :create, "build/#{name}"

    return "build/#{name}"
  end

  def build_multiple_sitemaps(pages)
    built_sitemaps = []
    total_sitemaps = (pages.count / 50000.0).ceil
    pages_per_sitemap = (50000.0 / total_sitemaps).ceil
    built_sitemaps << build_sitemap_index(total_sitemaps)
    1.upto(total_sitemaps) do |i|
      sitemap_pages = pages[((i - 1) * pages_per_sitemap)...(i * pages_per_sitemap)]
      built_sitemaps << build_sitemap("sitemap#{i}.xml", sitemap_pages)
    end

    return built_sitemaps
  end

  def gzip_file(sitemap)
    require 'zlib'
    content = File.read(sitemap)
    File.open("#{sitemap}.gz", 'wb') do |f|
      gz = Zlib::GzipWriter.new(f, Zlib::BEST_COMPRESSION)
      gz.write content
      gz.close
    end
  end

  # Returns a URL with proper HTML entities
  def encode(path)
    str = path.split("/").map { |f| app.escape_html(f) }.join("/")
    return str
  end

end
