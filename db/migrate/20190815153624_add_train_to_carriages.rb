class AddTrainToCarriages < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :carriages, :train
  end
end
