class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, limit: 100, null: false
      t.text :content, null: true, default: nil
      t.date :published_at
      t.string :address, limit: 150, null: true, default: nil
      t.timestamps null: false
    end
  end
end
