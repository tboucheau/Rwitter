class AddPseudoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pseudo
  end
end
