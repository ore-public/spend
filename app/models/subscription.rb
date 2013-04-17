class Subscription < ActiveRecord::Base
  include Enumerize

  attr_accessible :collection_id, :status, :user_id

  belongs_to :user
  belongs_to :collection

  validates_uniqueness_of :user_id, scope: [:collection_id]

  enumerize :status, in: [:read, :offer, :reject]

end
