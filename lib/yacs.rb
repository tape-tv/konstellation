require 'yacs/version'

require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'

module Yacs
  def self.yaml_path(path)
    Pathname.new(path)
  end

  def self.load(path, &defaults)
    if yaml_path(path).exist?
      config = YAML.load(yaml_path(path).open('r:utf-8'))
    else
      config = defaults.call
    end

    config.with_indifferent_access
  end
end
