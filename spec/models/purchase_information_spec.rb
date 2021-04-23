require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_information = FactoryBot.build(:purchase_information, item_id: @item.id, user_id: @user.id)
    sleep 0.1
  end

  describe '購入情報の登録' do
    context '登録できる時' do
      it 'postal_code, shipping_area_id, municipality, address, phone_number、tokenが、存在すれば登録できる' do
        expect(@purchase_information).to be_valid
      end
      it 'postal_codeが、ハイフン有りの半角数字であれば登録できる' do
        @purchase_information.postal_code = '111-1111'
        expect(@purchase_information).to be_valid
      end
      it 'phone_numberが、半角数字であれば登録できる' do
        @purchase_information.phone_number = '00000000000'
        expect(@purchase_information).to be_valid
      end
      it 'building_nameが、空でも登録できる' do
        @purchase_information.building_name = ''
        expect(@purchase_information).to be_valid
      end
    end
    context '登録できない時' do
      it 'postal_codeが、空では登録できない' do
        @purchase_information.postal_code = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが、全角数字だと保存できない' do
        @purchase_information.postal_code = '１１１−１１１１'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeに、ハイフンが含まれていないと登録できない' do
        @purchase_information.postal_code = '1111111'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'shipping_area_idが、空だと登録できない' do
        @purchase_information.shipping_area_id = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが、1を選択すると登録できない' do
        @purchase_information.shipping_area_id = 1
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Shipping area Prefecture Select')
      end
      it 'municipalityが、空だと登録できない' do
        @purchase_information.municipality = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが、空だと登録できない' do
        @purchase_information.address = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが、空だと登録できない' do
        @purchase_information.phone_number = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが、全角数字だと登録できない' do
        @purchase_information.phone_number = '０００００００００００'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが、12桁以上では登録できない' do
        @purchase_information.phone_number = 111_111_111_111
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが、空だと登録できない' do
        @purchase_information.token = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが、空だと登録できない' do
        @purchase_information.user_id = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが、空だと登録できない' do
        @purchase_information.item_id = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
