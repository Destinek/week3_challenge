require 'users'


class UserRepository
  
  def all
    sql = 'SELECT id, username, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, []) 
    users = []

    result_set.each do |records|
      user = User.new
    
      user.id = records['id'].to_i
      user.username = records['username']
      user.email = records['email']

      users << user
    end 

    return users 
  end 

  def find(id)
    sql = 'SELECT id, username, email FROM users WHERE id = $1;'
    params =[id]
   
    result_set = DatabaseConnection.exec_params(sql, params)
    records = result_set[0]
    
    user = User.new 
    user.id = records['id']
    user.username = records['username']
    user.email = records['email']
    return user
  end

  def create(user)
    sql = 'INSERT INTO users (username, email) VALUES ($1, $2);'
    params =[user.username, user.email]
   
    result_set = DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end

  def update(user)
    sql = 'UPDATE users SET username = $1, email = $2 WHERE id = $3;'
    params = [user.username, user.email, user.id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end
end 
