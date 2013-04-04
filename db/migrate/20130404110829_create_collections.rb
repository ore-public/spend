class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.string :name
      t.string :approval

      t.timestamps
    end
  end
end
