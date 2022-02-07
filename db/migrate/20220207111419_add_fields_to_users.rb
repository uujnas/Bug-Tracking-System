class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :surname, :string
    add_column :users, :phone_no, :string
  end
end
