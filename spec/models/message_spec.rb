require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ保存' do
    context "メッセージが投稿できる場合" do
      it "textがあれば投稿できる" do
        expect(@message).to be_valid
      end
    end
    context "メッセージが投稿できない場合" do
      it "textが、空だと投稿できない" do
        @message.text = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Text can't be blank")
      end
      it "userに、紐付いていなければ投稿できない" do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
      it "itemに、紐付いていなければ投稿できない" do
        @message.item = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
