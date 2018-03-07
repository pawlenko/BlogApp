class AddUserToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user,  foreign_key: true
  end

  def down
      drop_column :user
  end
end
