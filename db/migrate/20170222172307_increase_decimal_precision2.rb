class IncreaseDecimalPrecision2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :shipping_total
    add_column :orders, :shipping_total, :decimal, precision: 9, scale: 2

    remove_column :orders, :discount_total
    add_column :orders, :discount_total, :decimal, precision: 9, scale: 2

    remove_column :orders, :total
    add_column :orders, :total, :decimal, precision: 9, scale: 2

    remove_column :orders, :total_tax
    add_column :orders, :total_tax, :decimal, precision: 9, scale: 2
  end
end
