class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.belongs_to :question_id, index: true
      t.string :answer_1_result
      t.string :answer_2_result
      t.string :answer_3_result
      t.string :answer_4_result
      t.string :answer_5_result

      t.timestamps
    end
  end
end
