class RenameQuestionIdToSurveySurvey < ActiveRecord::Migration
  def change
    rename_column :survey_results, :question_id_id, :survey_id
  end
end
