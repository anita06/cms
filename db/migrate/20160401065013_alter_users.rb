class AlterUsers < ActiveRecord::Migration

  def up
    #rename_table("users","admin_users")
    add_column("admin_users","first_name",:string, :limit => 25)
    add_column("admin_users","last_name",:string, :limit => 25)
    add_column("admin_users","email",:string, :limit => 100)
    #change_column("admin_users","email",:string, :limit => 100)
    #rename_column("admin_users","password","hashed_password")
    #puts "*** Adding an index is next ***"
    add_index("admin_users","username")
  end

  # down method is used to undo the changes done in up the method
  def down
    remove_index("admin_users","username")
    #rename_column("admin_users","hashed_password","password")
    #change_column("admin_users","email",:string, default => "", :null => false)
    remove_column("admin_users","first_name")
    remove_column("admin_users","last_name")
    remove_column("admin_users","email")
    #rename_table("admin_users","users")
  end

end
