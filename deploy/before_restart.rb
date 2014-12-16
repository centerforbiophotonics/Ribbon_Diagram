rails_env = Rails.env

Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env}...")
Chef::Log.info("********************************")

execute "rake assets:precompile" do
  cwd release_path
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => rails_env
end