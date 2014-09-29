class SurveyResultsController < ApplicationController
  
  def create
    if session['passed_survey']
      respond_to do |format|
        format.js { render 'fails'}
      end
      return false
    end

    params[:survey_result][:session_id] = request.session_options[:id]
    params[:survey_result][:survey_id] = params[:survey_id]
    @survey_result = SurveyResult.new survey_result_params
    respond_to do |format|
      if @survey_result.save
        session['passed_survey'] = true
        format.js
      end
    end

  end


  private

  def survey_result_params
    params.require(:survey_result).permit :result, :session_id, :survey_id
  end
end