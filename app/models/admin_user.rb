class AdminUser < ActiveRecord::Base

  # To configure a different table name:
  # self.table_name = "admin_users"
  has_secure_password

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  scope:sorted, lambda  { order("last_name ASC, first_name ASC") }

  def name
    "#{first_name } #{last_name }"
  end



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
