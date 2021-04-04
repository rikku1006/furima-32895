require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、kana_first_nameとkana_last_name、birthdayが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字6文字以上のであれば登録できる' do
        @user.password = 'e3w2q1'
        @user.password_confirmation = 'e3w2q1'
        expect(@user).to be_valid
      end
      it 'kana_first_nameとkana_last_nameが全角カナであれば保存できる' do
        @user.kana_first_name = 'オ'
        @user.kana_last_name = 'オ'
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@が無いと登録できない' do
        @user.email = 'remail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが6文字以上の半角英数字でないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordが6文字以下だと登録できない' do
        @user.password = '1q2w3'
        @user.password_confirmation = '1q2w3'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英語のみでは登録できない' do
        @user.password = 'qqqqqq'
        @user.password_confirmation = 'qqqqqq'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'q１q１q１'
        @user.password_confirmation = 'q１q１q１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'お名前(全角)first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)first_nameが全角でないと登録できない' do
        @user.first_name = 'o'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name First name Full-width characters')
      end
      it 'お名前(全角)last_nameが全角でないと登録できない' do
        @user.last_name = 'o'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Last name Full-width characters')
      end
      it 'お名前カナ(全角)kana_first_nameが空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'お名前カナ(全角)kana_last_nameが空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'お名前カナ(全角)kana_first_nameがカナ全角でないと登録できない' do
        @user.kana_first_name = 'お'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name First name kana Full-width katakana characters')
      end
      it 'お名前カナ(全角)kana_last_nameがカナ全角でないと登録できない' do
        @user.kana_last_name = 'お'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name Last name kana Full-width katakana characters')
      end
      it '生年月日birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
