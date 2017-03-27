require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with message image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without message" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください。")
    end

  end
end
