class Order < ApplicationRecord
  belongs_to :wordpress
  scope :last_30_days, -> { where("wordpress_created_at >= ?", 30.days.ago) }
  scope :between_dates, -> (date_begin, date_end) { where(wordpress_created_at: date_begin.beginning_of_day..date_end.end_of_day) }
  scope :converted, -> { where(status: 'processing').or(where(status: 'completed')) }
end
