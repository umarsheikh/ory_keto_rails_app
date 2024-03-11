class Ory::OauthController < ApplicationController
  include Ory::ApiClientInitializer

  def new
    redirect_to auth_url, allow_other_host: true
  end

  def callback
    if params[:code]
      @token = fetch_tokens
      save_tokens(@token)
    else
      render :error
    end
  end

  private

  def fetch_tokens
    oauth_client.auth_code.get_token(
      params[:code],
      redirect_uri: callback_url
    )
  end

  def auth_url
    oauth_client.auth_code.authorize_url(
      scope: SCOPE,
      redirect_uri: callback_url,
      state: SecureRandom.uuid
    )
  end

  def callback_url
    callback_ory_oauth_url
  end

  def save_tokens(token)
    OryOauthToken.create(
      access_token: token.token,
      refresh_token: token.refresh_token,
      expires_at: Time.at(token.expires_at)
    )
  end
end
