class LinkReportGroupReport < ActiveRecord::Migration[5.2]
  def change
    create_join_table :reports, :report_groups do |t|
      t.int :category_id
      t.int :user_id
    end
  end
end
