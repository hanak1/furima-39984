require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユ－ザ－新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、encrypted_password、last_name、first_name、japanese_last_name、japanese_first_name、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = '1ｑｗｒｔｐｓ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前（全角）は半角では登録できない' do
        @user.japanese_last_name = 'myouji'
        @user.valid?
        expect(@user.errors.full_messages).to include('Japanese last name 全角文字を使用してください')
      end
      it 'お名前（全角）は半角では登録できない' do
        @user.japanese_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it 'お名前カナ（全角）はひらがなでは登録できない' do
        @user.japanese_last_name = 'myouji'
        @user.valid?
        expect(@user.errors.full_messages).to include('Japanese last name 全角文字を使用してください')
      end
      it 'お名前カナ（全角）はひらがなでは登録できない' do
        @user.japanese_last_name = 'myouji'
        @user.valid?
        expect(@user.errors.full_messages).to include('Japanese last name 全角文字を使用してください')
      end
      it 'お名前カナ（全角）は空では登録できない' do
        @user.japanese_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it 'お名前カナ（全角）は空では登録できない' do
        @user.japanese_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it 'お名前カナ（全角）は空では登録できない' do
        @user.japanese_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it 'お名前カナ（全角）は空では登録できない' do
        @user.japanese_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it '誕生日は空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
