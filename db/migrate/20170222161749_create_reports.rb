class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.decimal :sales, precision: 10, scale: 2
      t.integer :orders
      t.integer :items
      t.decimal :tax, precision: 10, scale: 2
      t.decimal :shipping, precision: 10, scale: 2
      t.decimal :discount, precision: 10, scale: 2
      t.integer :customers

      t.timestamps
    end
  end
end
