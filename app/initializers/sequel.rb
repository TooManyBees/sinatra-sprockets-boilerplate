config = YAML.load_file("./config/database.yml")[ENV['RACK_ENV']||'development']
Sequel.extension :pg_array
$db = Sequel.postgres(config)
