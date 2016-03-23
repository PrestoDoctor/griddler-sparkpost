require 'griddler'
require 'griddler/sparkpost/version'
require 'griddler/sparkpost/adapter'

module Griddler
  module Sparkpost
  end
end

Griddler.adapter_registry.register(:sparkpost, Griddler::Sparkpost::Adapter)
