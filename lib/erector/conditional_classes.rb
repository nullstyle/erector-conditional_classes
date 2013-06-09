require "erector/conditional_classes/version"
require 'active_support/concern'
require 'active_support/core_ext/module/aliasing'
require 'erector'

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

        unless should_render
          # hacky: we set the block at this level
          # so even if bail out because we shouldn't render the class
          # we still get expected behavior on the final member of a chain
          @inside_renderer = block if block_given?
          _render
          return self
        end
      end

      method_missing_without_conditionals(method_name, *args, &block)
    end

  end
end

Erector::Promise.send(:include, Erector::ConditionalClasses)