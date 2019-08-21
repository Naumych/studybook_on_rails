class AddNumberInTrainToCarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :carriages, :number_in_train, :integer
  end
end
