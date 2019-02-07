class AddAttendEventReferencesToUsers < ActiveRecord::Migration[5.2]
  def change
  	def change
     add_column :users, :attend_event_id, :integer
    end
  end
end
