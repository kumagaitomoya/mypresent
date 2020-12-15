require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe '#create' do
    context 'メッセージ投稿がうまくいくとき' do
      it '全てが入力されれば出品できる' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージ投稿がうまくいくいかないとき' do
      it 'photo_nameが空だと保存できないこと' do
        @message.photo_name = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('フォト名を入力してください')
      end

      it 'photo_nameが空だと保存できないこと' do
        @message.photo_message = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('フォトメッセージを入力してください')
      end

      it 'imagesが空だと保存できないこと' do
        @message.images = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('フォトを選択してください')
      end
    end
  end
end
