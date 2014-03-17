class UpdateIndexOnUsers < ActiveRecord::Migration
  def change
  end

  def up
    sql = 'Drop Index index_users_on_email'
    sql << 'ON users' if Rails.env = 'production' # Heroku pg
    ActiveRecord::Base.connection.execute(sql)
  end
end
