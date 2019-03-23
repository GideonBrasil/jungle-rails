class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :pruduct, index: true, foreign_key: true
      t.integer :user, index: true, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
