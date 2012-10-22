class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.references :menu
      t.integer :price

      t.timestamps
    end
    add_index :items, :menu_id
  end
end
