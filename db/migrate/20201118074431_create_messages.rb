class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string   :photo_name,     null: false
      t.text     :photo_message,  null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

