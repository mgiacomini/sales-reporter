class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :wordpress
      t.string :status
      t.string :order_key
      t.integer :number
      t.decimal :shipping_total, precision: 5, scale: 2
      t.decimal :discount_total, precision: 5, scale: 2
      t.decimal :total, precision: 5, scale: 2
      t.decimal :total_tax, precision: 5, scale: 2
      t.string :payment_method
      t.string :payment_method_title
      t.string :customer_ip_address
      t.string :customer_user_agent
      t.timestamp :completed_at
      t.timestamp :paid_at

      t.timestamps
    end
  end
end
