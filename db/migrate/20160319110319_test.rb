class Test < ActiveRecord::Migration
    def change
      create_table :test do |t|
        t.name
      end
    end  
end
