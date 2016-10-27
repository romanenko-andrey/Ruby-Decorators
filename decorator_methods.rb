module Decorators
  def self.included(base)
    base.extend DecoratorsMethods
  end

  module DecoratorsMethods
    @prefix, @postfix = nil, nil

    def add_prefix(message)
      @prefix  = message
    end

    def add_postfix(message)
      @postfix  = message
    end

    def method_added(method)
      return if @last_function == method
      origin_method = instance_method(method)

      @last_function = method
      prefix, postfix  = @prefix, @postfix
      @prefix, @postfix = nil, nil

      define_method method do
        (prefix ||= '') + origin_method.bind(self).call.to_s + (postfix ||= '')
      end
    end
  end
end