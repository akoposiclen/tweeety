class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
  	add_index :users, :email, :unique => true
  end

  def selfdown
  	remove_index :users, :email
  end
end
