class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.references :menu
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :items, :menu_id
  end
end
