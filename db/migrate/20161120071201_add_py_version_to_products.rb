class AddPyVersionToProducts < ActiveRecord::Migration
  def change
    add_column :submissions, :py_version, :int
  end
end
