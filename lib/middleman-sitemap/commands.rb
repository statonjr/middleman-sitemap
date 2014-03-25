require 'middleman-core/cli'
require 'middleman-sitemap/extension'

module Middleman
  module Cli
    class Sitemap < Thor
      include Thor::Actions

      check_unknown_options!

      namespace "sitemap"

      def self.source_root
        ENV['MM_ROOT']
      end

      def self.exit_on_failure?
        true
      end

      desc "sitemap:build", "Builds a sitemap outside of the build process"
      option :gzip, type: :boolean,
                     desc: "GZIP sitemap after build",
                     aliases: :g
      option :hostname, type: :string,
                      desc: "The hostname that you want to use in your sitemap",
                      aliases: :b

      def build
        shared_instance = ::Middleman::Application.server.inst

        if shared_instance.respond_to? :sitemap
          # Override options based on what was passed on the command line
          shared_instance.options.gzip = options[:gzip] if options[:gzip]
          shared_instance.options.hostname = options[:hostname] if options[:hostname]

          shared_instance.generate_sitemap
        else
          raise Thor::Error.new "You need to activate the sitemap extension in config.rb"
        end
      end
    end
  end
end
