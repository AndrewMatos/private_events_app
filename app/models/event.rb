class Event < ApplicationRecord
	validates(:name, :location, :description, :time, presence: true)
	belongs_to :host, class_name: 'User', foreign_key: 'user_id'
	has_many :attend_events
	#has_many :users, through: :attend_events
	has_many :attendees, through: :attend_events, source: :user

	

	scope :past, -> { where("time < ?",Time.now)}

	scope :upcoming, -> { where("time > ?",Time.now)}

	
end
