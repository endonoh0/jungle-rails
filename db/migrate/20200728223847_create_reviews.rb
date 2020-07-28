class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
    end
  end
end
