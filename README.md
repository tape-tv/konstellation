# Schrank

A simple YAML config file loader.

[![Build](https://travis-ci.org/tape-tv/schrank.svg?branch=master)](https://travis-ci.org/tape-tv/schrank)
[![Docs](https://inch-ci.org/github/tape-tv/schrank.svg?branch=master)](https://inch-ci.org/github/tape-tv/schrank)
[![Gem](https://badge.fury.io/rb/schrank.svg)](https://rubygems.org/gems/schrank)

## Usage

```ruby
require 'schrank'
```

Load your config, providing defaults.

```ruby
config = Schrank.load(Rails.root.join('config/production.yml')) do
  {
    provider: 's3',
    prefix: 'folder/'
  }
end
```

See [the docs](http://www.rubydoc.info/github/tape-tv/schrank/master) for more details.

## License

MIT.

## Contribution

Contributions welcome! Create a pull request and we'll get back to you as soon as
possible. Open an issue to discuss anything big.

This project has a code of conduct, found in the root of this repo. Please read it
before contributing.
