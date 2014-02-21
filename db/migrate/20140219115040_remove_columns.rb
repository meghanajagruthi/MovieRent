class RemoveColumns < ActiveRecord::Migration
  def self.up
  remove_column :movies, :category_id
 end
end
