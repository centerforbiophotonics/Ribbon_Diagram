Chef::Log.info("Precompiling assets.")
Chef::Log.info("********************************")

rails_env = new_resource.environment["RAILS_ENV"]

execute "rake assets:precompile" do
  cwd release_path
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => rails_env
end