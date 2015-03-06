rails_env = new_resource.environment["RAILS_ENV"]
devise = new_resource.environment["DEVISE_SECRET_KEY"]

Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env} in #{release_path}.")
Chef::Log.info("Devise Key=#{devise}.")

execute "rake assets:precompile" do
  cwd release_path
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => rails_env
end