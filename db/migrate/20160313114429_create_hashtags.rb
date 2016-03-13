class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :tag
      t.timestamps null: false
    end

    create_table :hashtags_tweets, id: false do |t|
      t.integer :hashtag_id, index: true
      t.integer :tweet_id, index: true
    end
  end
end
