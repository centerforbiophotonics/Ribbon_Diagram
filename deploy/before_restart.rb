Chef::Log.info("Precompiling assets.")
Chef::Log.info("********************************")

execute "rake assets:precompile" do
  cwd current_path
  command "bundle exec rake assets:precompile"
end