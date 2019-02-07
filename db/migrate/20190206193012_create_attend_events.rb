class CreateAttendEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :attend_events do |t|
      t.references :event ,index: true
      t.references :user ,index: true

      t.timestamps
    end
  end
end
