class AddCollectionIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :collection_id, :integer
  end
end
