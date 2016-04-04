class Section < ActiveRecord::Base

  scope:sorted, lambda { order("sections.position ASC") }

end
