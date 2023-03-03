require 'posts'
class PostsRepository
  def all 
    sql = 'SELECT id, title, content, user_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, []) 
    posts = []

    result_set.each do |records|
      post = Posts.new
    
      post.id = records['id'].to_i
      post.title = records['title']
      post.content = records['content']
      post.user_id = records['user_id'].to_i

      posts << post
    end 
    return posts 
  end 

  def find(id)
    sql = 'SELECT id, title, content, user_id FROM posts where id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    records = result_set[0]
    
    post = Posts.new 
    post.id = records['id'].to_i
    post.title = records['title']
    post.content = records['content']
    post.user_id = records['user_id'].to_i
    return post
  end 

  def create(post)

    sql = 'INSERT INTO posts (title, content, user_id) VALUES ($1, $2, $3);'
    params =[post.title, post.content, post.user_id]
   
    result_set = DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end 

  def update(post)
    sql = 'UPDATE posts SET title = $1, content = $2, user_id = $3 WHERE id = $4;'
    params = [post.title, post.content, post.user_id ,post.id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end 
end 