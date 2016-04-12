class CreateAuthorizeResponses < ActiveRecord::Migration
  def change
    create_table :authorize_responses do |t|
      t.string :api_key
      t.string :ecobee_pin
      t.string :code
      t.string :scope
      t.integer :expires_in
      t.integer :interval

      t.timestamps null: false
    end
  end
end
