class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :project, null: false, foreign_key: true
      t.text :information
      t.integer :capacity
      t.string :location
      t.boolean :closed

      t.timestamps
    end
  end
end
