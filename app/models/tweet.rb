class Tweet < ApplicationRecord
  scope :recent, -> { order('created_at desc') }

  #アソシエーション
  belongs_to :user
end
