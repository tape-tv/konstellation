require 'yacs/version'

require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'

module Yacs
  def self.yaml_path(path)
    Pathname.new(path)
  end

  def self.development?
    ((defined?(Rails) && Rails.env) || ENV['RACK_ENV'] || ENV['APP_ENV']) == 'development'
  end

  def self.load(path, &defaults)
    config = {}

    if yaml_path(path).exist?
      config.merge!(YAML.load(yaml_path(path).open('r:utf-8')))
      config.merge!(defaults.call) if defaults && development?
    else
      puts "Could not find config file at #{path}, loading defaults"
      config.merge!(defaults.call) if defaults
    end

    config.with_indifferent_access
  end
end
