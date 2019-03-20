class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :subreddit
      t.text :title
      t.string :url
      t.integer :viewcount
      t.string :thumbnail

      t.timestamps
    end
  end
end
