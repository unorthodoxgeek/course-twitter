class Tweet < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :hashtags
  has_many :mentions
  has_many :mentioned_users, through: :mentions, source: :user

  before_create :add_mentions
  before_create :add_hashtags

  private

  def add_mentions
    usernames = text.scan(/@\w+/).map{|i| i[1..-1]}
    usernames.each do |username|
      mentions.build(user: User.where(username: username).first)
    end
  end

  def add_hashtags
    hashtagz = text.scan(/#\w+/).map{|i| i[1..-1]}
    hashtagz.each do |tag|
      hashtag = Hashtag.where(tag: tag).first_or_create
      self.hashtags << hashtag
    end
  end
end
