class Order < ApplicationRecord
  belongs_to :wordpress
  scope :last_30_days, -> { where("wordpress_created_at >= ?", 30.days.ago) }
  # Article.where(title: 'Rails 3').or(Article.where(title: 'Rails 4'))
  scope :converted, -> { where(status: 'processing').or(where(status: 'completed')) }
end
