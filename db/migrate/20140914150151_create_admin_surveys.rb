class CreateAdminSurveys < ActiveRecord::Migration
  def change
    create_table :admin_surveys do |t|
      t.string :question
      t.string :answer_1
      t.string :answer_2
      t.string :answer_3
      t.string :answer_4
      t.string :answer_5

      t.timestamps
    end
  end
end
