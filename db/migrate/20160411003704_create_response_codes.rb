class CreateResponseCodes < ActiveRecord::Migration
  def change
    create_table :response_codes do |t|
      t.integer :code
      t.string :message
      t.string :meaning

      t.timestamps null: false
    end
  end
end
