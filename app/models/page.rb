class Page < ActiveRecord::Base

  scope:sorted, lambda {order("pages.position ASC")}
  
end
