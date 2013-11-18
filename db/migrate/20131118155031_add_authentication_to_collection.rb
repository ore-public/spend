class AddAuthenticationToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :authentication, :string
  end
end
