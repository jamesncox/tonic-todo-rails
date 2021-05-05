class ChangeTitleToText < ActiveRecord::Migration[6.1]
  def change
    rename_column :todos, :text
  end
end
