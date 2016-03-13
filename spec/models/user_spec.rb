require 'rails_helper'

RSpec.describe User, type: :model do
  describe "follow relationship" do
    let(:user) {User.create}
    let(:second){User.create}

    it "allowes adding followees" do
      user.followed_users << second

      user.reload
      expect(user.followed_users).to include(second)
      expect(user.followed_users).not_to include(user)
    end

    it "allowes adding follower" do
      user.followed_users << second

      second.reload
      expect(second.followers).to include(user)
      expect(second.followers).not_to include(second)
    end
  end
end
