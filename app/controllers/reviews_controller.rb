class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_car_wash

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @car_wash.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    if Review.where('created_by = ? and car_wash_id = ?', session_id, @car_wash.id).any?
      redirect_to @car_wash, alert: 'Вы уже оставляли отзыв'
      return false
    end
    @review = Review.new(review_params)
    @review.created_by = session_id
    @review.car_wash = @car_wash

    
    respond_to do |format|
      if @review.save
        @review.car_wash.rating = @car_wash.reload.reviews.average(:rating).to_f
        @review.car_wash.save

        format.html { redirect_to car_wash_path(@car_wash), notice: 'Спасибо! Отзыв добавлен' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def session_id
    request.session_options[:id]
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to [:car_wash,@review], notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to car_wash_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_car_wash
      @car_wash = CarWash.find(params[:car_wash_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:text, :rating, :user_name, :car_wash_id, images_attributes: [:image])
    end
end
