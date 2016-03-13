require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "mentions" do
    let(:user){User.create(username: "first")}
    let(:second){User.create(username: "second")}

    it "adds a mention" do
      second
      expect {
        @tweet = user.tweets.create(text: "I am mentioning @second")
      }.to change(Mention, :count).by(1)
      expect(@tweet.mentioned_users).to include(second)
    end

    it "adds a hashtag" do
      expect {
        @tweet = user.tweets.create(text: "I am a douche! #yolo")
      }.to change(Hashtag, :count).by(1)
      expect(@tweet.hashtags.count).to eq(1)
    end
  end
end
