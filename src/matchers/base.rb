module Matchers
  class Base
    def self.equals?(*_)
      raise NotSupportedError
    end

    def self.not?(*args)
      !equals?(*args)
    end

    def self.min?(*_)
      raise NotSupportedError
    end

    def self.max?(*_)
      raise NotSupportedError
    end
  end
end
