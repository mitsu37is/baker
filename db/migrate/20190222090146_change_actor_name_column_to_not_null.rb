class ChangeActorNameColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :actors, :name, :string, null: true
  end

  def down
    change_column :actors, :name, :string, null: false
  end
end
