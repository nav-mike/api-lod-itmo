class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :app_key
      t.string :dataset
      t.integer :requests_count

      t.timestamps null: false
    end
  end
end
