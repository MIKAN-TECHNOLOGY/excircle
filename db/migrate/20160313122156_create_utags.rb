class CreateUtags < ActiveRecord::Migration
  def change
    create_table :utags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
