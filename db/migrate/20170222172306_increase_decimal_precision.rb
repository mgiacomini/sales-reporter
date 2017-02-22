class IncreaseDecimalPrecision < ActiveRecord::Migration[5.0]
  def change
    remove_column :reports, :sales
    add_column :reports, :sales, :decimal, precision: 9, scale: 2

    remove_column :reports, :tax
    add_column :reports, :tax, :decimal, precision: 9, scale: 2

    remove_column :reports, :shipping
    add_column :reports, :shipping, :decimal, precision: 9, scale: 2

    remove_column :reports, :discount
    add_column :reports, :discount, :decimal, precision: 9, scale: 2
  end
end
