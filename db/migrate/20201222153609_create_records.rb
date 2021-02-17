class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.string  :calc_type
      t.string  :link_token
      t.jsonb   :calc_data
      t.timestamps
    end
  end
end
