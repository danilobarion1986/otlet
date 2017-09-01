require "otlet/version"
require 'yaml'

# https://github.com/bitbucket-rest-api/bitbucket
# https://stackoverflow.com/questions/6233124/where-to-place-access-config-file-in-gem

module Otlet
  # Configuration defaults
  @config = {
              :log_level => "verbose",
              :min => 0,
              :max => 99 
            }

  @valid_config_keys = @config.keys

  # Configure through hash
  def self.configure(opts = {})
    opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym}
  end

  # Configure through yaml file
  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML::load(IO.read(path_to_yaml_file))
    rescue Errno::ENOENT
      log(:warning, "YAML configuration file couldn't be found. Using defaults."); return
    rescue Psych::SyntaxError
      log(:warning, "YAML configuration file contains invalid syntax. Using defaults."); return
    end

    configure(config)
  end

  def self.config
    @config
  end

  def self.scramble(array)
    array.shuffle

  rescue NoMethodError
  	puts 'Error!'
  end
end
