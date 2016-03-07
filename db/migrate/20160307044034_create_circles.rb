class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name
      t.string :appeal
      t.string :detail
      t.string :campus
      t.binary :official
      t.binary :intercollege
      t.integer :tag_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
