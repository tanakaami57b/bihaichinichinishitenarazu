class User < ApplicationRecord
  # deviseモジュール有効化。データーベース認証、ユーザー登録、パスワードリセット、ログイン情報保存、バリデーション
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy

end
