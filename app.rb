class App < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :app_dir, File.join(settings.root, "app")
  set :views, File.join(settings.app_dir, "views")
  set :public_folder, File.join(settings.root, "public")
  set :json_encoder, MultiJson
  helpers Sinatra::ContentFor
  register Sinatra::Namespace

  configure :development do
    register Sinatra::Reloader
    use BetterErrors::Middleware
    BetterErrors.application_root = settings.app_dir
  end

  %w{ initializers config models controllers }.each do |dir|
    Dir.glob(File.join settings.app_dir, dir, "**", "*.rb").each do |file|
      also_reload file if development?
      require file
    end
  end

end
