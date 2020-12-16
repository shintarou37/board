class CreateCollects < ActiveRecord::Migration[6.0]
  def change
    create_table :collects do |t|
      t.text :explanation,          null: false
      t.integer :language_id
      t.integer :type_id
      t.integer :goal_id
      t.integer :framework_id
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
