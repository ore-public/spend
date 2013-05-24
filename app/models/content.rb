# == Schema Information
#
# Table name: contents
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  description       :text
#  youtube_url       :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  collection_id     :integer
#  youtube_embed_url :string(255)
#  youtube_image_url :string(255)
#

class Content < ActiveRecord::Base
  attr_accessible :description, :title, :youtube_url, :collection_id
  before_save :update_embed_url

  belongs_to :collection

  private
  def update_embed_url
    if youtube_url.present?
      require 'open-uri'
      doc = Nokogiri.HTML(open(youtube_url))
      self.youtube_image_url = doc.xpath('//meta[@property="og:image"]').first.attributes["content"].value
      self.youtube_embed_url = doc.xpath('//meta[@name="twitter:player"]').first.attributes["content"].value
    end
  end
end
