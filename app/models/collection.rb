class Collection < ActiveRecord::Base
  attr_accessible :approval, :name, :user_id

  belongs_to :owner,
             class_name: 'User',
             foreign_key: 'user_id'

  has_many :contents

end
