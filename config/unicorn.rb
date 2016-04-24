def prod?
  ENV['RACK_ENV'] == "production"
end

root_dir = "/opt/www"
tmp_dir = File.join(root_dir, "tmp");

listen_path = prod? ?
  File.join(tmp_dir, "sockets", "unicorn.sock") :
  3050

worker_processes (prod? ? 2 : 1)

working_directory root_dir

if prod?
  stderr_path "#{root_dir}/log/unicorn.error.log"
  stdout_path "#{root_dir}/log/unicorn.access.log"
end

pid File.join(tmp_dir, "pids", "unicorn.pid")

listen listen_path, backlog: 64
timeout (prod? ? 30 : 1*24*60*60) # 1 day on dev, because you can't rush binding.pry
