class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :pay_for_shipping
  belongs_to :shipping_area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :category_id,            numericality: { other_than: 1 }
    validates :product_condition_id,   numericality: { other_than: 1 }
    validates :pay_for_shipping_id,    numericality: { other_than: 1 }
    validates :shipping_area_id,       numericality: { other_than: 1 }
    validates :days_to_ship_id,        numericality: { other_than: 1 }
    validates :price,                  numericality: { only_integer: true, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' Out of setting range' }
  end
end
