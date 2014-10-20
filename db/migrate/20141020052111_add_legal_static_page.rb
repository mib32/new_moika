class AddLegalStaticPage < ActiveRecord::Migration
  def change
    StaticPage.create(permalink: 'legal')
  end
end
