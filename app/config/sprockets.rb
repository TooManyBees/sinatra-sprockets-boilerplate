App.class_eval do
  configure do

    set :assets_prefix, "/s"
    set :sprockets, Sprockets::Environment.new(settings.root)
    set :digest_assets, true
    set(:assets_path) {
      File.join(settings.root, public_folder, assets_prefix)
    }

    %w[ stylesheets javascripts images ].each do |dir|
      path = File.join(settings.app_dir, "assets", dir)
      settings.sprockets.append_path(path) if File.exist?(path)
    end

    Sprockets::Helpers.configure do |config|
      config.environment = settings.sprockets
      config.manifest = Sprockets::Manifest.new(settings.sprockets, File.join(settings.assets_path, "manifest.json"))
      config.prefix = settings.assets_prefix
      config.digest = settings.digest_assets
      config.public_path = settings.public_folder
      config.debug = development?
    end

    helpers do
      include Sprockets::Helpers
    end

  end

end
