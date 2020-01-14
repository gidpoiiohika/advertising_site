class CreateAdverts < ActiveRecord::Migration[5.2]
  def change
    create_table :adverts do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
