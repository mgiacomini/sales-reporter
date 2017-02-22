class CreateWordpresses < ActiveRecord::Migration[5.0]
  def change
    create_table :wordpresses do |t|
      t.string :name
      t.string :url
      t.string :consumer_key
      t.string :consumer_secret

      t.timestamps
    end
  end
end
