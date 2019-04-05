class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.bigint :feed_id

      t.timestamps
    end
  end
end
