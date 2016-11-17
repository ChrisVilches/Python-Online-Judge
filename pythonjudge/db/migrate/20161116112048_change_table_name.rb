class ChangeTableName < ActiveRecord::Migration
  def change  	
  	rename_table :casos, :testcases
  	rename_table :envios, :submissions

  	rename_column :problems, :enunciado, :statement
  	rename_column :testcases, :entrada, :input
  	rename_column :testcases, :salida, :output
  	rename_column :testcases, :publico, :public
  end
end
