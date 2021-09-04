require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it 'image, name, explanation, category_id, condition_id, defrayer_id, prefecture_id, delivery_day_id, priceがあれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationがないと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが選択されていないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが選択されていないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'defrayer_idが選択されていないと出品できない' do
        @item.defrayer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Defrayer can't be blank")
      end
      it 'prefecture_idが選択されていないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが選択されていないと出品できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceがないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では出品できない' do
        @item.price = '150'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で300~99999999の範囲で入力してください')
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で300~99999999の範囲で入力してください')
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１９８００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で300~99999999の範囲で入力してください')
      end
      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
