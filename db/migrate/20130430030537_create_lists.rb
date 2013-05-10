class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :status
      t.string :category
      t.boolean :publicity

      t.timestamps
    end
  end
end
