class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :sleep_time
      t.datetime :wake_time
      t.integer :duration

      t.timestamps
    end
  end
end
