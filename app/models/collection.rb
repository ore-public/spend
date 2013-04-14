class Collection < ActiveRecord::Base
  include Enumerize

  attr_accessible :approval, :name, :user_id, :owner

  belongs_to :owner,
             class_name: 'User',
             foreign_key: 'user_id'

  has_many :contents
  has_many :subscriptions

  validates :owner, presence: true

  enumerize :approval, in: [:necessary, :unnecessary]

end
