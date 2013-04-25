class AddYoutubeEmbedUrlToContents < ActiveRecord::Migration
  def change
    add_column :contents, :youtube_embed_url, :string
  end
end
