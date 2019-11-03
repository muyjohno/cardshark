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

    def self.all?(card, opts)
      opts.all? { |args| equals?(card, *args) }
    end

    def self.any?(card, opts)
      opts.any? { |args| equals?(card, *args) }
    end

    def self.none?(*args)
      !any?(*args)
    end
  end
end
