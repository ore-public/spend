class Content < ActiveRecord::Base
  attr_accessible :description, :title, :youtube_url

  belongs_to :collection
  
end
