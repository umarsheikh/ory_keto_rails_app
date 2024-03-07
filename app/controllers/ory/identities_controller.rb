class  Ory::IdentitiesController < ApplicationController
  include Ory::ApiClientInitializer

  def index
    @users = fetch_identities_from_ory
  end

  private
  def fetch_identities_from_ory
    identities_path = 'admin/identities'
    request = api_client.build_request(:GET, identities_path, request_options)
    JSON.parse(request.run.body)
  end
end
