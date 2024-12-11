class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true, null: false

      # 追加カラム
      t.integer :required_time, null: true # 所要時間
      t.integer :required_cost, null: true # 所要金額
      t.integer :parts, null: true # パーツ
      t.string :image_url # 画像URL

      t.timestamps
    end
  end
end
