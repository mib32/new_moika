class AddSessionIdToSurveyResults < ActiveRecord::Migration
  def change
    add_column :survey_results, :session_id, :string
  end
end
