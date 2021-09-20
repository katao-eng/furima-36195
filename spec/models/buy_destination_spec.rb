require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_destination = FactoryBot.build(:buy_destination, user_id: user.id, item_id: item.id)
    sleep 0.001
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it 'postal_code, prefecture_id, municipalities, house_number, building_name, tel, tokenがあれば購入できる' do
        expect(@buy_destination).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @buy_destination.building_name = ''
        expect(@buy_destination).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it 'postal_codeが空だと購入できない' do
        @buy_destination.postal_code = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに半角のハイフンがないと購入できない' do
        @buy_destination.postal_code = '1231234'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Postal code 3桁ハイフン4桁の半角数字で入力してください')
      end
      it 'postal_codeが半角数字でないと購入できない' do
        @buy_destination.postal_code = '１２３-１２３４'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Postal code 3桁ハイフン4桁の半角数字で入力してください')
      end
      it 'prefecture_idが選択されていないと購入できない' do
        @buy_destination.prefecture_id = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureで「---」が選択されていると購入できない' do
        @buy_destination.prefecture_id = 1
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesがないと購入できない' do
        @buy_destination.municipalities = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberがないと購入できない' do
        @buy_destination.house_number = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("House number can't be blank")
      end
      it 'telがないと購入できない' do
        @buy_destination.tel = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telにハイフンがあると購入できない' do
        @buy_destination.tel = '090-1111-1111'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Tel ハイフンは入力せず、半角数字のみで入力してください（10桁〜11桁）')
      end
      it 'telが半角数字でないと購入できない' do
        @buy_destination.tel = '０９０１１１１１１１１'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Tel ハイフンは入力せず、半角数字のみで入力してください（10桁〜11桁）')
      end
      it 'telが9桁以下だと購入できない' do
        @buy_destination.tel = '123456789'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Tel ハイフンは入力せず、半角数字のみで入力してください（10桁〜11桁）')
      end
      it 'telが12桁以上だと購入できない' do
        @buy_destination.tel = '123456789012'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Tel ハイフンは入力せず、半角数字のみで入力してください（10桁〜11桁）')
      end
      it 'tokenがないと購入できない' do
        @buy_destination.token = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'ユーザーが紐づいていないと購入できない' do
        @buy_destination.user_id = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐づいていないと購入できない' do
        @buy_destination.item_id = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
