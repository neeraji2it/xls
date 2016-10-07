class AddTrainerIdToUsers < ActiveRecord::Migration
  def change
  		 add_column :users, :trainer_id, :string
  end
end
