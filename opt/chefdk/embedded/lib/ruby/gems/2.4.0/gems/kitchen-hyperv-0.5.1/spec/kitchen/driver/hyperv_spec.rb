# -*- encoding: utf-8 -*-
#
# Author:: Fletcher (<fnichol@nichol.ca>)
#
# Copyright (C) 2015, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative "../../spec_helper"

require "logger"
require "stringio"
require "kitchen"
require 'kitchen/driver/hyperv_version'
require "kitchen/driver/hyperv"
require "kitchen/provisioner/dummy"
require "kitchen/transport/dummy"
require "kitchen/verifier/dummy"

describe Kitchen::Driver::Hyperv do

  let(:logged_output) { StringIO.new }
  let(:logger)        { Logger.new(logged_output) }
  let(:config)        { { :kitchen_root => "c:/test_root" } }
  let(:platform)      { Kitchen::Platform.new(:name => "fooos-99") }
  let(:suite)         { Kitchen::Suite.new(:name => "suitey") }
  let(:verifier)      { Kitchen::Verifier::Dummy.new }
  let(:provisioner)   { Kitchen::Provisioner::Dummy.new }
  let(:transport)     { Kitchen::Transport::Dummy.new }
  let(:state_file)    { stub("state_file") }
  let(:state)         { Hash.new }
  let(:env)           { Hash.new }

  let(:driver_object) { Kitchen::Driver::Hyperv.new(config) }

  let(:driver) do
    d = driver_object
    instance
    d
  end

  let(:instance) do
    Kitchen::Instance.new(
      :verifier => verifier,
      :driver => driver_object,
      :logger => logger,
      :suite => suite,
      :platform => platform,
      :provisioner => provisioner,
      :transport => transport,
      :state_file => state_file
    )
  end

  #before { stub_const("ENV", env) }

  it 'driver api_version is 2' do
    driver.diagnose_plugin[:api_version].must_equal(2)
  end
end
