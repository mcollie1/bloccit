class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :string # removed :role to push db:migate to heroku
  end
end
