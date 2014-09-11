class Admin::NavsController < AdminController
  before_action :set_nav, only: [:show, :edit, :update, :destroy]

  # GET /navs
  # GET /navs.json
  def index
    @navs = Nav.all.order(position: :asc)
  end

  # GET /navs/1
  # GET /navs/1.json
  def show
  end

  # GET /navs/new
  def new
    @nav = Nav.new
  end

  # GET /navs/1/edit
  def edit
  end

  # POST /navs
  # POST /navs.json
  def create
    @nav = Nav.new(nav_params)
    res = @nav.save
    
    if res
      @nav.update(position: @nav.id)
    end

    respond_to do |format|
      if res
        format.html { redirect_to [:admin, @nav], notice: 'Nav was successfully created.' }
        format.json { render :show, status: :created, location: @nav }
      else
        format.html { render :new }
        format.json { render json: @nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navs/1
  # PATCH/PUT /navs/1.json
  def update
    respond_to do |format|
      if @nav.update(nav_params)
        format.html { redirect_to [:admin, @nav], notice: 'Nav was successfully updated.' }
        format.json { render :show, status: :ok, location: @nav }
      else
        format.html { render :edit }
        format.json { render json: @nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navs/1
  # DELETE /navs/1.json
  def destroy
    @nav.destroy
    respond_to do |format|
      format.html { redirect_to admin_navs_url, notice: 'Nav was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_position
    @nav = Nav.find(nav_params[:id])
    @nav.insert_at nav_params[:position].to_i
    @nav.save

    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def  set_nav
      @nav = Nav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nav_params
      params.require(:nav).permit(:id, :name, :path, :image_url, :hidden_xs, :position)
    end
end
