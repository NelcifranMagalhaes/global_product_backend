class Product < ApplicationRecord
  has_many :prices
  validates :name, :expiration, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ 'expiration', 'name' ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ 'prices' ]
  end
end
