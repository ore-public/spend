# == Schema Information
#
# Table name: collections
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  description     :text
#  password_digest :string(255)
#  authentication  :string(255)
#

class Collection < ActiveRecord::Base
  extend Enumerize

  has_secure_password
  attr_accessible :authentication, :name, :user_id, :owner, :description
  attr_accessible :password, :password_digest

  belongs_to :owner,
             class_name: 'User',
             foreign_key: 'user_id'

  has_many :contents

  validates :owner, presence: true
  validates :authentication, presence: true
  validates :password, presence: true, if: Proc.new{|collection| collection.authentication.necessary?}

  scope :managed, lambda{|user| where(:user_id => user)}
  scope :unmanaged, lambda{|user| where("user_id <> ?", user.id)}

  enumerize :authentication, in: [:necessary, :unnecessary], scope: true

end
