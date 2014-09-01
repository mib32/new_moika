class TempSessionController < ApplicationController
  layout false
  skip_before_action :temp_require_login

  def show
  end

  def index
  end

  def create
    if params[:password] == '1234'
      session['athd'] = true
      redirect_to :root
    else
      redirect_to temp_session_index_path
    end
  end
end
