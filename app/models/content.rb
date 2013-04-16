class Content < ActiveRecord::Base
  attr_accessible :description, :title, :youtube_url, :collection_id

  belongs_to :collection
  
end
