class AdminUser < ActiveRecord::Base

  # To configure a different table name:
  # self.table_name = "admin_users"


  # commented code job will be performed through active record
  # To access attribute of object AdminUser
  # short way
  #attr_accessor :first_name

  # long way
  # reading method
  ##def last_name
    #@last_name
  #end

  # set method
  #def last_name=(value)
    #@last_name = value
  #end


end
