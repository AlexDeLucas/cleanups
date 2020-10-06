class CreateCleanups < ActiveRecord::Migration[5.2]
  def change
    create_table :cleanups do |t|
      t.string :title, null: false
      t.string :posted_by, null: false
      t.date :date, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :cleanup_type, null:false
      t.integer :volunteers, null:false
      t.integer :total_trash, null:false
      t.text :description
      t.string :cleanup_photo
      t.belongs_to :user

      t.timestamps
    end
  end
end
