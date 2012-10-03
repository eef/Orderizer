class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :user_id
      t.integer :order_id
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
