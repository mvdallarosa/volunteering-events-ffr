class AddClosedToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :closed, :boolean, default: false
  end
end
