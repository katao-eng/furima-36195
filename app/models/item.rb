class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :defrayer
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :defrayer_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :image, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999, message: '半角数字で300~99999999の範囲で入力してください' }

  validates :category_id, :condition_id, :defrayer_id, :prefecture_id, :delivery_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
