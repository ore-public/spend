class AddYoutubeImageUrlToContents < ActiveRecord::Migration
  def change
    add_column :contents, :youtube_image_url, :string
  end
end
