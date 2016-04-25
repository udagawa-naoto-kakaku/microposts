class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite, :text
  end
end
