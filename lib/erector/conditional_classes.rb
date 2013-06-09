require "erector/conditional_classes/version"
require 'active_support/concern'
require 'active_support/core_ext/module/aliasing'

module Erector
  module ConditionalClasses
    extend ActiveSupport::Concern

    included do
      alias_method_chain :method_missing, :conditionals
    end

    def method_missing_with_conditionals(method_name, *args, &block)
      if args.last.is_a?(Hash) && args.last.has_key?(:if)
        should_render = args.last.delete(:if)
        should_render = should_render.call if should_render.respond_to?(:call)

        return self unless should_render
      end

      method_missing_without_conditionals(method_name, *args, &block)
    end

  end
end

Erector::Promise.send(:include, Erector::ConditionalClasses)