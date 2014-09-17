class Admin::SurveysController < AdminController
  before_action :set_admin_survey, only: [:show, :edit, :update, :destroy]

  # GET /admin/surveys
  # GET /admin/surveys.json
  def index
    @admin_surveys = Admin::Survey.all
  end

  # GET /admin/surveys/1
  # GET /admin/surveys/1.json
  def show
  end

  # GET /admin/surveys/new
  def new
    @admin_survey = Admin::Survey.new
  end

  # GET /admin/surveys/1/edit
  def edit
  end

  # POST /admin/surveys
  # POST /admin/surveys.json
  def create
    @admin_survey = Admin::Survey.new(admin_survey_params)

    respond_to do |format|
      if @admin_survey.save
        format.html { redirect_to @admin_survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @admin_survey }
      else
        format.html { render :new }
        format.json { render json: @admin_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/surveys/1
  # PATCH/PUT /admin/surveys/1.json
  def update
    respond_to do |format|
      if @admin_survey.update(admin_survey_params)
        format.html { redirect_to @admin_survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_survey }
      else
        format.html { render :edit }
        format.json { render json: @admin_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/surveys/1
  # DELETE /admin/surveys/1.json
  def destroy
    @admin_survey.destroy
    respond_to do |format|
      format.html { redirect_to admin_surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_survey
      @admin_survey = Admin::Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_survey_params
      params.require(:admin_survey).permit(:question, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5)
    end
end
