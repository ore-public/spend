class RemoveApprovalFromCollection < ActiveRecord::Migration
  def up
    remove_column :collections, :approval
  end

  def down
    add_column :collections, :approval, :string
  end
end
