class RemoveActivityToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :activity
  end
end
