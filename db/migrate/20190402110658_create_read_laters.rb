class CreateReadLaters < ActiveRecord::Migration[5.2]
  def change
    create_table :read_laters do |t|
      t.string :reddit_link

      t.timestamps
    end
  end
end
