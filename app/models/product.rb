class Product < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('start_at ASC') }
  validates :user_id, :title, :price, :step, :start_at, :duration, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
