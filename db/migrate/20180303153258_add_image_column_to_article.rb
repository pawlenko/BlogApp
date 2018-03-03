class AddImageColumnToArticle < ActiveRecord::Migration[5.1]
  def up 
    add_attachment :articles, :image
  end

  def down 
    remove_attachment :articles, :image
  end
end
