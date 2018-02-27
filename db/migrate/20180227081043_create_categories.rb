class CreateCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :categories do |t|
      t.string  "name",:limit=>20,:default=>"",:null =>false
      t.integer "lp",:null=>false
      t.boolean "visible",:default =>true
      t.timestamps
    end
  end

  def down
  drop_table :categories
  end
end
