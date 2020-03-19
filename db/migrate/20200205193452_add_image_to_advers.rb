class AddImageToAdvers < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :image, :string
    add_index :adverts, :image
  end
end
