require 'rails_helper'

RSpec.describe Celeb, type: :model do
  before do
    @celeb = FactoryBot.build(:celeb)
  end

  describe '有名人新規登録' do
    context '新規登録できるとき' do
      it '必須のものが全て記入されていたら登録できる' do
        expect(@celeb).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @celeb.password = '123456a'
        @celeb.password_confirmation = '123456a'
        expect(@celeb).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      
      it 'imageが空だと登録できない' do
        @celeb.image = nil
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Image can't be blank")
      end

      it 'emailが空だと登録できない' do
        @celeb.email = ''
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Email can't be blank")
      end

      it 'nameが空だと登録できない' do
        @celeb.name = ''
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと登録できない' do
        @celeb.description = ''
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Description can't be blank")
      end

      it 'passwordが空だと登録できない' do
        @celeb.password = nil
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @celeb.password = '12345'
        @celeb.password_confirmation = '12345'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @celeb.password = '123456'
        @celeb.password_confirmation = '1234567'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @celeb.save
        another_celeb = FactoryBot.build(:celeb, email: @celeb.email)
        another_celeb.valid?
        expect(another_celeb.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが半角英語のみでは登録できないこと' do
        @celeb.password = 'aaaaaa'
        @celeb.password_confirmation = 'aaaaaa'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include( "Password is invalid")
      end

      it 'passwordが数字のみでは登録できないこと' do
        @celeb.password = '123456'
        @celeb.password_confirmation = '123456'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角英数混合では登録できないこと' do
        @celeb.password = 'ABC１２３４５６'
        @celeb.password_confirmation = 'ABC１２３４５６'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Password is invalid")
      end

      it 'emailが@を含めない場合は登録できないこと' do
        @celeb.email = '111111'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Email is invalid")
      end

      it '重複したnameがあると登録できないこと' do
        @celeb.save
        another_celeb = FactoryBot.build(:celeb, email: @celeb.email)
        another_celeb.valid?
        expect(another_celeb.errors.full_messages).to include('Email has already been taken')
      end

      it 'descriptionが120字以上だと登録できないこと' do
        @celeb.description = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @celeb.valid?
        expect(@celeb.errors.full_messages).to include("Description is too long (maximum is 120 characters)")
      end
    end
  end
end
