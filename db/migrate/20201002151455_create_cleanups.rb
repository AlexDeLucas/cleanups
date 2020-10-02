class CreateCleanups < ActiveRecord::Migration[5.2]
  def change
    create_table :cleanups do |t|
      t.date :date, null: false
      t.string :location, null: false
      t.integer :volunteer_num, null: false
      t.integer :trash_pounds, null: false
      t.text :description
      t.string :cleanup_pic

      t.belongs_to :user

      t.timestamps
    end
  end
end
