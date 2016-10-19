class CreateCategorySnowboards < ActiveRecord::Migration[5.0]
  def change
    create_table :category_snowboards do |t|
      t.integer :category_id
      t.integer :snowboard_id
      t.timestamps null: false
    end
  end
end
