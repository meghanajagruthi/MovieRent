class AddIndexToCustomersMobileNumber < ActiveRecord::Migration
  def change
    add_index :customers, :mobile_number
  end
end
