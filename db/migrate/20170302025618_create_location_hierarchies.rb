class CreateLocationHierarchies < ActiveRecord::Migration[5.0]
  def change
    create_table :location_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :location_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true, name: "location_udx"
    add_index :location_hierarchies, [:descendant_id],
      name: "location_idx"
  end
end
