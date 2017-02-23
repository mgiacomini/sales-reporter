class AddWordpressTimestampsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :wordpress_created_at, :date
    add_column :orders, :wordpress_updated_at, :date
  end
end
