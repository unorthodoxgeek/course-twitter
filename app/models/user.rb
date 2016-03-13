class User < ActiveRecord::Base
  has_many :tweets
  has_many :mentions

  has_many :follows, foreign_key: :follower_id
  has_many :followed_users, through: :follows, source: :followee, class_name: "User"

  has_many :reverse_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :reverse_follows, source: :follower, class_name: "User"
end
