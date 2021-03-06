# Buff::ShellOut

[![Gem Version](https://badge.fury.io/rb/buff-shell_out.svg)](http://badge.fury.io/rb/buff-shell_out) [![Build Status](https://travis-ci.org/berkshelf/buff-shell_out.svg?branch=master)](https://travis-ci.org/berkshelf/buff-shell_out)

Buff up your code with a mixin for issuing shell commands and collecting the output

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'buff-shell_out'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install buff-shell_out
```

## Usage

Using it as a mixin:

```ruby
require 'buff/shell_out'

class PowerUp
  include Buff::ShellOut
end

power_up = PowerUp.new
power_up.shell_out("ls") #=> <#Buff::ShellOut::Response @exitstatus=0, @stdout="...", @stderr="...">
```

Using it as a module:

```ruby
require 'buff/shell_out'

Buff::ShellOut.shell_out("ls") #=> <#Buff::ShellOut::Response @exitstatus=0, @stdout="...", @stderr="...">
```

# Authors and Contributors

- Jamie Winsor ([jamie@vialstudios.com](mailto:jamie@vialstudios.com))

Thank you to all of our [Contributors](https://github.com/berkshelf/buff-shell_out/graphs/contributors), testers, and users.
