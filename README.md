# Schrank

## Usage

```ruby
require 'schrank'
```

Simply load a config.

```ruby
config = Schrank.load(File.join(Rails.root, 'config', 'config.yml'))
```

Specify defaults when file does not exist.

```ruby
config = Schrank.load(File.join(Rails.root, 'config', 'storage.yml')) {
  {
    provider: 's3',
    prefix: 'folder/'
  }
}
```
