class AddStatusToAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :status, :string, default: "active"
  end
end
