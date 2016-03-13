class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.belongs_to :tweet
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
