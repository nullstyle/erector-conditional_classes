# Erector::ConditionalClasses

erector-conditional_classes is a rubygem that makes using the conditional
application of html classes in your views nicer.  

Erector provides a wonderful chain-based api for applying classes to an element:

```ruby
span.foo.bar.baz "hello" # => '<span class="foo bar baz">hello</span>'
```

The pain comes when you need to conditionally apply classes to an element:

```ruby
classes = [:foo]
classes << :bar if some_condition?

span("hello", :class => classes) # => '<span class="foo">hello</span>'
```

This gem provides support in the chaining API for conditionals:

```ruby
#block based
span.foo.bar(:if => some_condition?){ text "hello" } # => '<span class="foo">hello</span>'

# non-block content
span("hello").foo.bar(:if => some_condition?) # => '<span class="foo">hello</span>'
```

## Installation

Add this line to your application's Gemfile:

    gem 'erector-conditional_classes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install erector-conditional_classes

## Usage

just:

```ruby
require 'erector/conditional_classes'
```

and your good to go.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
