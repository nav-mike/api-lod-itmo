class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name, limit: 32, null: false
      t.string :description, limit: 200, null: true, default: nil
      t.string :link, limit: 100, null: true, default: nil
      t.string :key, limit: 20, null: false
      t.timestamps null: false
    end
    
    add_index :applications, :key, unique: true
    add_index :applications, :name, unique: true
  end
end
