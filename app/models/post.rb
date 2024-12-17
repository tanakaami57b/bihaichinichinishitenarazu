class Post < ApplicationRecord
    enum required_time: {
    three_min: 0,   # 3分
    five_min: 1,    # 5分
    ten_min: 2,     # 10分
    thirty_min: 3,  # 30分
    one_hour: 4,    # 1時間
    one_and_half_hour: 5, # 1時間半
    over_two_hours: 6     # 2時間以上
  }
    enum required_cost: {
        free: 0,            # 0円
        under_1000: 1,      # 1000円未満
        from_1000_to_5000: 2, # 1000円以上5000円以内
        from_5000_to_10000: 3, # 5000円以上10000円以内
        over_10000: 4       # 10000円以上
      }
      enum parts: {
        skin: 0,
        head: 1,
        face: 2,
        upper_body: 3,
        lower_body: 4,
        whole_body: 5,
        other: 6
      }

    validates :title, presence: true, length: { maximum: 255 }
    validates :content, presence: true, length: { maximum: 65_535 }

    belongs_to :user
    has_many :comments, dependent: :destroy
end
