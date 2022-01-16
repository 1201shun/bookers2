class RemoveEmailFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :email, :string
  end
end
