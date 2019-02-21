class AddProfileColumnToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :profile, :text
  end
end
