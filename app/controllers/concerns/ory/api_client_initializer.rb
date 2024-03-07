module Ory::ApiClientInitializer
  TOKEN_TYPE = 'api_key'

  def api_client
    @api_client ||= OryKetoClient::ApiClient.new(configuration)
  end

  def read_api
    @read_api ||= OryKetoClient::ReadApi.new(api_client)
  end

  def request_options
    {
      header_params: authorization_header
    }
  end

  private

  def authorization_header
    {"Authorization"=> "#{configuration.api_key_prefix[TOKEN_TYPE]} #{configuration.api_key[TOKEN_TYPE]}"}
  end

  def configuration
    @config ||= OryKetoClient::Configuration.new do |config|
      config.scheme = 'https'
      config.host = ENV['API_BASE_URL'].split("//").last
      config.api_key[TOKEN_TYPE] = ENV['ORY_API_KEY']
      config.api_key_prefix[TOKEN_TYPE] = 'Bearer'
      config.server_index = nil
    end
  end
end
