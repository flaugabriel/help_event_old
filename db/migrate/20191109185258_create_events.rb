class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :description
      t.decimal :total
      t.datetime :data_event

      t.timestamps
    end
  end
end
