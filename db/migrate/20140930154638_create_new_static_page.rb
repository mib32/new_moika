class CreateNewStaticPage < ActiveRecord::Migration
  def change
    StaticPage.create! title: 'О Проекте', permalink: 'new_about'
  end
end
