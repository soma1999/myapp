require 'rails_helper'

RSpec.describe Inquiry, type: :model do

  before do
    @inquiry = FactoryBot.build(:inquiry)
  end

  describe 'お問い合わせメールの送信' do
    context 'お問い合わせメールの送信できるとき' do
      it  '必須のものが全て記入されていたら登録できる' do
        expect(@inquiry).to be_valid
      end
    end    

    context 'お問い合わせメールの送信できないとき' do
      it 'nameが空では送信できないこと' do
        @inquiry.name = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Name 名前を入力してください")
      end

      it 'emailが空では送信できないこと' do
        @inquiry.email = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Email メールアドレスを入力してください")
      end

      it 'messageが空では送信できないこと' do
        @inquiry.message = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Message お問い合わせ内容を入力してください")
      end
    end
  end
end
