class CreateCollects < ActiveRecord::Migration[6.0]
  def change
    create_table :collects do |t|
      t.text :explanation,        null: false
      t.integer :language_id,     null: false
      t.timestamps
    end
  end
end
