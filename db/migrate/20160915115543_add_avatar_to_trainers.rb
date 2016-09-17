class AddAvatarToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :avatar, :string
  end
end
