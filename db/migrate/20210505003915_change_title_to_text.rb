class ChangeTitleToText < ActiveRecord::Migration[6.1]
  def change
    rename_column :todos, :title, :text
  end
end
