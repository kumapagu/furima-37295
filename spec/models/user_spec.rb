require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'abcdgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it '重複したemailでは登録できない' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abcd1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は不正な値です')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end

      it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end

      it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）は不正な値です')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
