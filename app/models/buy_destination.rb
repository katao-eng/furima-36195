class BuyDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :tel, :buy,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '3桁ハイフン4桁の半角数字で入力してください' }
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'ハイフンは入力せず、半角数字のみで入力してください' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                       house_number: house_number, building_name: building_name, tel: tel, buy_id: buy.id)
  end
end
