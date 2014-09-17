json.array!(@admin_surveys) do |admin_survey|
  json.extract! admin_survey, :id, :question, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5
  json.url admin_survey_url(admin_survey, format: :json)
end
