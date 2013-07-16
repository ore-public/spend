# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  approval    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Collection < ActiveRecord::Base
  extend Enumerize

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
    subscription(user) && subscription(user).status.read?
  end

  def subscription(user)
    self.subscriptions.find_by_user_id(user)
  end
end
