Forem::ForumsController.class_eval do
  layout 'application'
  before_action :find_forum
  private
  def find_forum
    @forum = Forem::Forum.friendly.find("default")
    authorize! :read, @forum
  end
end