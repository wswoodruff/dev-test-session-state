class CreateSessionsTable < ActiveRecord::Migration[5.1]
    def change
      create_table :sessions do |t|

        t.string :ip_address
        t.string :user
        t.timestamps                :null => false
      end
    end
end
