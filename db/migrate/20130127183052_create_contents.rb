class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.string :youtube_url

      t.timestamps
    end
  end
end
