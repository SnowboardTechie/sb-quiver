class CreateCatagories < ActiveRecord::Migration[5.0]
  def change
    create_table :catagories do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
