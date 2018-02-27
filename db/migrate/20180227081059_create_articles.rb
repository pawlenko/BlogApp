class CreateArticles < ActiveRecord::Migration[5.1]
  def up
    create_table :articles do |t|
      t.integer "category_id"
      t.string  "name",:limit=>20,:default=>""
      t.boolean "visible",:default =>true
      t.text    "content"
      t.timestamps
    end
  end

  def down
    drop_table :articles
  end

end
