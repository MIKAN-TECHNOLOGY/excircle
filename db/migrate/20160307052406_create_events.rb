class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.text :place
      t.integer :cost
      t.text :content
      t.integer :circle_id
      t.timestamps null: false
    end
  end
end
