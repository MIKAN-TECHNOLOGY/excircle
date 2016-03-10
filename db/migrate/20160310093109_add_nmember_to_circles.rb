class AddNmemberToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :n_member, :integer
  end
end
