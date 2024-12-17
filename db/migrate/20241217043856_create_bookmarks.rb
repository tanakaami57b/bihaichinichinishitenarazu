class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.boolean :notification_flag, default: false, null: false

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :post_id], unique: true
  end
end
