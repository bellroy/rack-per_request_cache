# Rack::PerRequestCache

Simple module for caching arbitrary objects / constructs during a request.

## Usage (Sinatra, Padrino, ...)

    require 'rack/per_request_cache'
    use Rack::PerRequestCache

## Rails

    # Gemfile
    gem 'rack-per_request_cache', require: 'rack/per_request_cache'

    # config/application.rb
    config.use 'Rack::PerRequestCache'

## Caveats

If Rack::PerRequestCache.clear_cache is not called, then no caching is performed.
When hooked up as a middleware (see above), then the cache is enable dy default during
the request lifecycle.

