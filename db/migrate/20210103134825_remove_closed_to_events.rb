class RemoveClosedToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :closed
  end
end
