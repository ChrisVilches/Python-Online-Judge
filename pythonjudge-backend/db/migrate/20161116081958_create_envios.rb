class CreateEnvios < ActiveRecord::Migration
  def change
    create_table :envios do |t|
      t.references :problem, index: true, foreign_key: true
      t.integer :verdict

      t.timestamps null: false
    end
  end
end
