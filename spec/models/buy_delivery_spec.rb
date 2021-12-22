require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_delivery = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it 'post_codeとprefecture_id、city、block、phone_number、tokenが存在すれば購入できる' do
        expect(@buy_delivery).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @buy_delivery.building = ''
        expect(@buy_delivery).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it 'post_codeが空では購入できない' do
        @buy_delivery.post_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが全角では購入できない' do
        @buy_delivery.post_code = '１１１−１１１１'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeに"-"が入っていないと購入できない' do
        @buy_delivery.post_code = '1111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが"○○○-○○○○"の形でなければ購入できない' do
        @buy_delivery.post_code = '11-11111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Post code is invalid')
      end

      it 'prefecture_idが空では購入できない' do
        @buy_delivery.prefecture_id = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが"1"では購入できない' do
        @buy_delivery.prefecture_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @buy_delivery.city = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では購入できない' do
        @buy_delivery.block = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @buy_delivery.phone_number = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字でなくては購入できない' do
        @buy_delivery.phone_number = '０９０１１１１１１１１'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @buy_delivery.phone_number = '090111111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁以下では購入できない' do
        @buy_delivery.phone_number = '090111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberに"-"が入っていると購入できない' do
        @buy_delivery.phone_number = '090-1111-1111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では購入できない' do
        @buy_delivery.token = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idと紐付いていないと購入できない' do
        @buy_delivery.user_id = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idと紐付いていないと購入できない' do
        @buy_delivery.item_id = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
