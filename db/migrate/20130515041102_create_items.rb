class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :note
      t.string :tag
      t.text :image
      t.references :list

      t.timestamps
    end
    add_index :items, :list_id
  end
end
