class AddStatusToBug < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :status, :integer
  end
end