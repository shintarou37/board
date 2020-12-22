class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.text    :GitHub
      t.text    :introduce
      t.integer :age_id
      t.integer :prefecture_id
      t.integer :language_id
      t.integer :type_id
      t.integer :goal_id
      t.references :user
      t.timestamps
    end
  end
end
