class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :binary
  end
end
