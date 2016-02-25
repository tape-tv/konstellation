require 'schrank/version'
require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'

module Schrank
  # Attempts to load YAML file. Falls back on defaults
  # hash when file is not found.
  #
  # In development mode, the defaults hash is merged
  # with the YAML file, with the file taking precedence.
  # This is intentional, since it allows shared config
  # to live in your application source code, but
  # per-user secrets (such as access keys) can be kept
  # in a file and out of version control.
  #
  # @example Simply load your config.
  #   config = Schrank.load(Rails.root.join('config/production.yml'))
  #
  # @example Load your config, providing defaults.
  #   config = Schrank.load(Rails.root.join('config/production.yml')) do
  #     {
  #       provider: 's3',
  #       prefix: 'folder/'
  #     }
  #   end
  #
  # @param [String] path The path to the config file
  # @yieldreturn [Hash] Default config
  # @return [ActiveSupport::HashWithIndifferentAccess]
  def self.load(path, &defaults)
    config = {}

    if yaml_path(path).exist?
      config.merge!(defaults.call) if defaults && development?
      config.merge!(YAML.load(yaml_path(path).open('r:utf-8')))
    else
      puts "Could not find config file at #{path}, loading defaults"
      config.merge!(defaults.call) if defaults
    end

    config.with_indifferent_access
  end

  # Returns true when the application is in development mode, otherwise returns false.
  #
  # @return [Boolean]
  def self.development?
    ((defined?(Rails) && Rails.env) || ENV['RACK_ENV'] || ENV['APP_ENV']) == 'development'
  end

  # @private
  def self.yaml_path(path)
    Pathname.new(path)
  end
end
