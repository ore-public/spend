class Collection < ActiveRecord::Base
  include Enumerize

  attr_accessible :approval, :name, :user_id, :owner, :description

  belongs_to :owner,
             class_name: 'User',
             foreign_key: 'user_id'

  has_many :contents
  has_many :subscriptions

  validates :owner, presence: true
  validates :approval, presence: true

  scope :managed, lambda{|user| where(:user_id => user)}
  scope :unmanaged, lambda{|user| where("user_id <> ?", user.id)}

  enumerize :approval, in: [:necessary, :unnecessary]

  def read?(user)
    subscription(user)
  end

  def subscription(user)
    self.subscriptions.find_by_user_id(user)
  end
end
