class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :description
      t.string :location
      t.timestamp :time
      t.text :involved
      t.boolean :resolved

      t.timestamps
    end
  end
end
