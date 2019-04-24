class CreateReportsReportGroupsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :reports, :report_groups do |t|
      t.integer :category_id
      t.integer :user_id
    end
  end
end
