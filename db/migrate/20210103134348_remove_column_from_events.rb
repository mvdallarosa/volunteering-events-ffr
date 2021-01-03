class RemoveColumnFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :capacity
  end
end
