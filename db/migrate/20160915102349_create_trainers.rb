class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :profile_type
      t.string :industry
      t.decimal :experience
      t.string :expertise
      t.string :geography
      t.float :rating
      t.string :references
      t.timestamps null: false
    end
  end
end
