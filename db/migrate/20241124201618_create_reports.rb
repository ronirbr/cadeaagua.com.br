class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports do |t|
      t.string :street
      t.datetime :water_out_at
      t.datetime :water_back_at
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
