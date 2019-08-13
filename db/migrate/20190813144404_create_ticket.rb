class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets, &:timestamps
  end
end
