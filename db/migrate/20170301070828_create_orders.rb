class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :rec_name
      t.string :rec_addr
      t.string :rec_phone
      t.float :total
      t.integer :status
      t.integer :user_id
      t.references :shop, foreign_key: true
      t.references :discount, foreign_key: true

      t.timestamps
    end
  end
end
