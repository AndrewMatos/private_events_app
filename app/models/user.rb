class User < ApplicationRecord
	validates(:email , :name, :password, presence: true)
	has_many :events , inverse_of: 'host'
	has_many :attend_events
	has_many :invitations, through: :attend_events, source: :event



	def upcoming_events(obj)
	     upcoming = []
	     obj.each do |u|
			if u.time>Time.now
				upcoming.push(u)
		    end		
		 end 
		 upcoming 
	end


	def previous_events(obj)
		previous = []
		obj.each do |u|
			if u.time<Time.now
				previous.push(u)
		    end		
		end 
		 previous   
    end

end
