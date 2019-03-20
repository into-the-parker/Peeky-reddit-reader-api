class AddRedditPermaLinkToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :redditlink, :string
  end
end
