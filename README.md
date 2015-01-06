# yacs - Yet Another (Simple) Config System

## Usage

```ruby
require 'yacs'

# Simply load a config
config = YACS.load(File.join(Rails.root, 'config', 'config.yml'))

# Specify defaults when file does not exist
config = YACS.load(File.join(Rails.root, 'config', 'storage.yml')) {
  {
    provider: 's3',
    prefix: 'folder/'
  }
}
```
