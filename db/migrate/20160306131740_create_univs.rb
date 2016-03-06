class CreateUnivs < ActiveRecord::Migration
  def change
    create_table :univs do |t|
      t.string :name
      t.timestamps
    end
  end
end
