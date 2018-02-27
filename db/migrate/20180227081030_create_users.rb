class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string "name", :limit=>20,:null=>false
      t.string "password_digest"
      t.string "email", :limit=>100, :default=>"",:null=>false
      t.timestamps
    end
  end

  def down
  drop_table :users
  end

end
