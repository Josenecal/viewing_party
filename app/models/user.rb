class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  
  has_secure_password

  def parties_im_hosting
    Party.all.where(host_id: self.id)
  end
end
