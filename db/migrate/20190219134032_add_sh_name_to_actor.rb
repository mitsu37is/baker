class AddShNameToActor < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :sh_name, :string, :after => :name
  end
end
