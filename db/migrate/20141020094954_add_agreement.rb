class AddAgreement < ActiveRecord::Migration
  def change
    StaticPage.create(permalink: 'agreement')
  end
end
