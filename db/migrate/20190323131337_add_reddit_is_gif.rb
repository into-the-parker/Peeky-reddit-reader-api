class AddRedditIsGif < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :isGif, :boolean
  end
end
