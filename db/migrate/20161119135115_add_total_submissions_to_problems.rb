class AddTotalSubmissionsToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :total_submissions, :integer, null: false, default: 0
    add_column :problems, :users_solved, :integer, null: false, default: 0
  end
end
