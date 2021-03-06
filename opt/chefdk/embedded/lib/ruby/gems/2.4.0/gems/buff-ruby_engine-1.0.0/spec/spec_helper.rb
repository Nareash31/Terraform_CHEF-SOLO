$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'buff/ruby_engine'

def setup_rspec
  RSpec.configure do |config|
    config.expect_with :rspec do |c|
      c.syntax = :expect
    end

    config.mock_with :rspec
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true
  end
end

if Buff::RubyEngine.jruby?
  require 'buff/ruby_engine'
  setup_rspec
else
  require 'spork'

  Spork.prefork { setup_rspec }
  Spork.each_run { require 'buff/ruby_engine' }
end
