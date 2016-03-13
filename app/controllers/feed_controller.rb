class FeedController < ApplicationController
  def index
    @tweets = Tweet.all
  end
end
