class Price < ApplicationRecord
  belongs_to :product
  validates :value, :currency, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    [ 'value' ]
  end
end
