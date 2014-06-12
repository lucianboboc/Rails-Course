class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :comment
      t.integer :stars
      t.references :movie, index: true

      t.timestamps
    end
  end
end
