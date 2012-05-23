class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.float :body_fat
      t.float :muscle
      t.float :water
      t.float :weight
      t.integer :fitocracy_score

      t.timestamps
    end
  end
end
