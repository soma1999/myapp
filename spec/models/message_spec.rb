require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'Messageの保存' do
    context 'Messageが保存できるとき' do
      it  '条件が全て揃っていれば保存できる' do
        expect(@message).to be_valid
      end
    end

    context 'Messageが保存できないとき' do
      it 'contentが空では保存できない' do
        @message.content = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it 'contentが100文字以上では保存できない' do
        @message.content = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @message.valid?
        expect(@message.errors.full_messages).to include("Content is too long (maximum is 100 characters)")
      end

      it 'roomが紐付いていないと保存できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
