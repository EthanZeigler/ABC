class CreateReportGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :report_groups do |t|
      t.text :name

      t.timestamps
    end
  end
end
