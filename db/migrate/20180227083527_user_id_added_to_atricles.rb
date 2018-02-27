class UserIdAddedToAtricles < ActiveRecord::Migration[5.1]
  def up
    add_column :articles,:user_id,:integer
    end
  end

