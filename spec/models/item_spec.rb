require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の登録' do
    context '登録できる時' do
      it 'image、product_name、product_description、category_id、product_condition_id、pay_for_shipping_id、shipping_area_id、days_to_ship_id、priceが、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが、半角数字であれば登録できる' do
        @item.price = 1111
        expect(@item).to be_valid
      end
      it 'priceが、300~9999999の範囲内であれば登録できる' do
        @item.price = 1111
        expect(@item).to be_valid
      end
    end
    context '登録できない時' do
      it 'imageが空では、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが、空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_descriptionが、空だと登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_idが、空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが、1を選択すると登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'product_condition_idが、空だと登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'product_condition_idが、1を選択すると登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 1')
      end
      it 'pay_for_shipping_idが、空だと登録できない' do
        @item.pay_for_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Pay for shipping can't be blank")
      end
      it 'pay_for_shipping_idが、1を選択すると登録できない' do
        @item.pay_for_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Pay for shipping must be other than 1')
      end
      it 'shipping_area_idが、空だと登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが、1を選択すると登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'days_to_ship_idが、空だと登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'days_to_ship_idが1を選択すると登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'priceが、空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが、300~9999999の範囲内でないと登録できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  Out of setting range')
      end
      it 'priceが、10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  Out of setting range')
      end
      it 'priceが、半角数字出ないと登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが、半角英数字混合では登録できない' do
        @item.price = '111１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが、半角英字のみでは登録できない' do
        @item.price = 'gjgjgjgj'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが、全角文字では登録できない' do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'userが、紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
