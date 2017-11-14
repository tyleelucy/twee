class Tweet < ApplicationRecord
	belongs_to :user

	has_many :tweet_tags
	has_many :tags, through: :tweet_tags

	validates :message, presence: true
  	validates :message, length: {maximum: 140, 
  		too_long: "Tweets are only 140 characters. Twee away!"}, on: :create

  private		

  	before_validation :link_check, on: :create
  	after_validation :apply_link, on: :create	
    
    def link_check
      if self.message.match /http(s)?:\/\//
    	arr = self.message.split
    	index = arr.map{ |x| x.include? "http"}.index(true)
        self.link = arr[index]
        if arr[index].length > 23
    	    arr[index] = "#{arr[index][0..20]}..."	
        end
    				
        self.message = arr.join(" ")
      end
     end

     def apply_link
  		arr = self.message.split
  		index = arr.map { |x| x.include? "http" }.index(true)
  		if index
  			url = arr[index]
  			arr[index] = "<a href='#{self.link}' target='_blank'>#{url}</a>"
		end
		self.message = arr.join(" ")
	 end		
end
