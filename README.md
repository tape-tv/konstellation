# Schrank

A simple YAML config file loader.

[![Build](https://travis-ci.org/tape-tv/schrank.svg?branch=master)](https://travis-ci.org/tape-tv/schrank)
[![Docs](https://inch-ci.org/github/tape-tv/schrank.svg?branch=master)](https://inch-ci.org/github/tape-tv/schrank)

## Usage

```ruby
require 'schrank'
```

Simply load a config.

```ruby
config = Schrank.load(Rails.root.join('config/production.yml'))
```

Provide defaults, which will only be used when the YAML file does not exist.

```ruby
config = Schrank.load(Rails.root.join('config/production.yml')) do
  {
    provider: 's3',
    prefix: 'folder/'
  }
end
```
