class Order < ApplicationRecord
  belongs_to :wordpress
  scope :last_30_days, -> { where("wordpress_created_at < ?", 30.days.ago) }
end
