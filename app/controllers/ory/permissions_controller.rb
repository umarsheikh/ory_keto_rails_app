class Ory::PermissionsController < ApplicationController
  include Ory::ApiClientInitializer

  def index
    @relation_tuples = fetch_relation_tupples_from_ory
  end

  private

  def fetch_relation_tupples_from_ory
    read_api.get_relation_tuples(request_options).relation_tuples
  end
end
