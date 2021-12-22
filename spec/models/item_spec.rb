require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    # @user = FactoryBot.create(:user)
    # @item = FactoryBot.build(:item, user_id: @user.id)
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it 'nameとitem_description、category_id、status_id、delivery_charge_id、prefecture_id、ship_days_id、price、imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'category_idに「---」が選択されている場合は出品できない' do
        @item.category_id = 1

        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'status_idに「---」が選択されている場合は出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'delivery_charge_idが空では出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'delivery_charge_idに「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'prefecture_idに「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'ship_days_idが空では出品できない' do
        @item.ship_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'ship_days_idに「---」が選択されている場合は出品できない' do
        @item.ship_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it 'priceが半角数字以外では出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は¥300〜¥9,999,999で入力してください')
      end

      it 'priceの数値が10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は¥300〜¥9,999,999で入力してください')
      end

      it 'priceの数値が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は¥300〜¥9,999,999で入力してください')
      end

      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
