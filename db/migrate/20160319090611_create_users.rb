class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      # Note Id is been automatically added by rails no need to define here.
      # When we dont want id for any table we need to specify it as below.
      # create_table :users, {:id => false} do |t|
      # long way for column definition
      t.column "first_name", : string, :limit => 25
      # short way for column definition
      t.string "last_name", :limit 50
      t.string "email" default => "", :null => false
      t.string "password",:limit => 40

      # No need to have below two fields as timestamps is already there
      #t.datatime "created_at"
      #t.datetime "updated_at"

      t.timestamps
    end
  end

  def down
    drop_table: users
  end


end
