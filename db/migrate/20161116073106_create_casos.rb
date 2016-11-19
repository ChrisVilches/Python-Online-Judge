class CreateCasos < ActiveRecord::Migration
  def change
    create_table :casos do |t|
      t.string :entrada
      t.string :salida
      t.references :problem
      t.boolean :publico

      t.timestamps null: false
    end
  end
end
