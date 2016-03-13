class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :utag, index: true, foreign_key: true
      t.references :circle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
