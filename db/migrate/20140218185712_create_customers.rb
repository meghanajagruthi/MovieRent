class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :Name
      t.string :mobile_number
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
