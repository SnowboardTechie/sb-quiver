class CreateSnowboards < ActiveRecord::Migration[5.0]
  def change
    create_table :snowboards do |t|
      t.string :brand
      t.string :name
      t.string :shape
      t.integer :length
      t.integer :user_id
      t.integer :category_id
    end
  end
end
