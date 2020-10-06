class DropCleanups < ActiveRecord::Migration[5.2]
  def change
    drop_table :cleanups
  end
end
