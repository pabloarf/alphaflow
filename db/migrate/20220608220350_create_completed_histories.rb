class CreateCompletedHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_histories do |t|
      t.datetime :completed_date
      t.integer :completed_status
      t.references :todo

      t.timestamps
    end
  end
end
