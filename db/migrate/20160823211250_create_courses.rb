class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, limit: 100, null: false
      t.string :description, limit: 200, null: true, default: nil
      t.string :link, limit: 100, null: true, default: nil
      t.string :teacher, limit: 100, null: false
      t.timestamps null: false
    end
  end
end
