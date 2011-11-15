# Simple module for caching blocks. If 'clear_cache' is not called
# then no caching will be performed

# Add this line to config/application.rb to ensure we only load one copy of the cache
# require File.join(Rails.root, "lib/per_request_cache")

class PerRequestCache

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

  def initialize(app)
    @app = app
  end

  def call(env)
    self.class.initialize_cache
    @app.call env
  ensure
    self.class.clear_cache
  end
end
