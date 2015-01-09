# This must be updated for each new controller (TODO: create custom generator that gets run after generate scaffold)
%w(
  access_levels
  diagrams
  institutions
  user_diagrams
  users
).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end