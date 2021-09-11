class Destination < ApplicationRecord
  belongs_to :buy

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "3桁ハイフン4桁の半角数字で入力してください"}
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :tel, format: {with: /\A\d{10,11}\z/, message: "ハイフンは入力せず、半角数字のみで入力してください"}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
