require 'base64'
require 'cgi'
require 'openssl'
require 'net/http'

module Realeyes
  class Connection
    attr_reader :config

    def initialize(config)
      config[:base_url] ||= "http://reportingapi.realeyesit.com/api/v1/"
      config[:signature_lifetime] ||= 60
      @config = config.symbolize_keys
    end

    def get api_method, params={}
      Net::HTTP.get_response(request_uri('get', api_method, params))
    end

    def post api_method, body={}, params={}
      uri = request_uri('post', api_method, params)
      request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type' => 'application/json'})
      request.body = body.to_json
      Net::HTTP.new(uri.host, uri.port).request(request)
    end

    def request_uri http_method, api_method, params
      uri = URI.parse(config[:base_url] + api_method)
      uri.query = URI.encode_www_form(params.merge(additional_params).to_a)
      URI.parse "#{uri.to_s}&Signature=#{signature(http_method, uri.to_s)}"
    end

    private

    def additional_params
      {
        "AccessKey" => config[:access_key],
        "Expiration" => Time.now.to_i + config[:signature_lifetime]
      }
    end

    def signature http_method, url
      encodable = [http_method.upcase, url].join(':')
      sig = Base64.encode64(OpenSSL::HMAC.digest('sha1', config[:secret_key], encodable))
      CGI.escape(sig.delete("\n"))
    end
  end
end
