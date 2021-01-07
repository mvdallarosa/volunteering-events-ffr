class AddRepeatToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :repeat, :string, default: 'never'
    add_column :events, :end_date, :string
  end
end
