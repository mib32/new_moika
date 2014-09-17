class RemoveResultColumnsFromSurveyResult < ActiveRecord::Migration
  def change
    remove_column :survey_results, :answer_1_result
    remove_column :survey_results, :answer_2_result
    remove_column :survey_results, :answer_3_result
    remove_column :survey_results, :answer_4_result
    remove_column :survey_results, :answer_5_result

    add_column :survey_results, :result, :integer
  end
end
