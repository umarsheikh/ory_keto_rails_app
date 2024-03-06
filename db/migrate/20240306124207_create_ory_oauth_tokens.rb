class CreateOryOauthTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :ory_oauth_tokens do |t|
      t.string :access_token
      t.string :refresh_token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
