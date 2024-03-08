class Ory::PermissionsController < ApplicationController
  include Ory::ApiClientInitializer

  def index
    @relation_tuples = fetch_relation_tupples_from_ory
  end

  def check
  end

  def verify
    @allowed = verify_permission
    render :check
  end

  private

  def fetch_relation_tupples_from_ory
    read_api.get_relation_tuples(request_options).relation_tuples
  end

  def verify_permission
    options = permitted_params.to_hash.merge(request_options)
    response = read_api.get_check(options.with_indifferent_access)
    response.allowed
  end

  def permitted_params
    params.permit(:subject_id, :object, :relation, :namespace, :max_depth)
  end
end
