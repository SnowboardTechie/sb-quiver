class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :snowboard_ids
    end
  end
end
