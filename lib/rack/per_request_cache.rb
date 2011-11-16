module Rack
  class PerRequestCache

    def initialize(app)
      @app = app
    end

    def call(env)
      self.class.initialize_cache
      @app.call env
    ensure
      self.class.clear_cache
    end

    # Cache management and accessor methods
    class << self
      def initialize_cache
        @cache = {}
      end

      def clear_cache
        @cache = nil
      end

      def cached(key, &block)
        return yield if @cache.nil?
        return @cache[key] if @cache.has_key?(key)

        @cache[key] = yield
      end
    end
  end
end
