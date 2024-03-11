class Ory::OauthController < ApplicationController

  API_BASE_URL = ENV['API_BASE_URL']
  AUTH_URL = "/oauth2/auth"
  TOKEN_URL = "/oauth2/token"
  SCOPE = 'openid offline_access'
  CLIENT_ID = ENV['ORY_CLIENT_ID']
  SECRET = ENV['ORY_SECRET']

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
  def client
    OAuth2::Client.new(CLIENT_ID, SECRET, site: API_BASE_URL, authorize_url: AUTH_URL, token_url: TOKEN_URL)
  end

  def fetch_tokens
    client.auth_code.get_token(
      params[:code],
      redirect_uri: callback_url
    )
  end

  def auth_url
    client.auth_code.authorize_url(
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
