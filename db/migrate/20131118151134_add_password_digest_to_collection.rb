class AddPasswordDigestToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :password_digest, :string
  end
end
