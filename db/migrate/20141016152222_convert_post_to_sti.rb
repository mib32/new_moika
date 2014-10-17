class ConvertPostToSti < ActiveRecord::Migration
  def change
    Post.connection.execute("UPDATE posts 
      SET type = case 
        when type = 'news' 
        then 'NewsPost' 
        when type = 'info' 
        then 'InfoPost' 
      end")
  end
end
