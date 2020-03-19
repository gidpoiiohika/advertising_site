class AddAttachmentsToAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :attachments, :json
  end
end
