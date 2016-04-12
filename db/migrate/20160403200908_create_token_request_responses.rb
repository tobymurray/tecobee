class CreateTokenRequestResponses < ActiveRecord::Migration
  def change
    create_table :token_request_responses do |t|
      t.string :access_token
      t.string :token_type
      t.integer :expires_in
      t.string :refresh_token
      t.string :scope

      t.timestamps null: false
    end
  end
end
