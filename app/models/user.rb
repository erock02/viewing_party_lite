class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  def parties_hosted
    viewing_parties.where("host_id = user_id")
  end
end
