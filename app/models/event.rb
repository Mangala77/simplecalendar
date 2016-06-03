class Event < ActiveRecord::Base
  def as_json(options = {})  
   {  
    :id => self.id,  
    :title => self.name,  
    :description => self.description || "",  
    :start => self.start_time,  
    :end => self.end_time
   }  
  end 
end
