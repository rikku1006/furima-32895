class PurchaseInformation

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,              format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :shipping_area_id,         numericality: { other_than: 1, message: "Prefecture Select" }
    validates :municipality
    validates :address
    validates :phone_number,             numericality: {only_integer: true, message: "Input only number"}
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end