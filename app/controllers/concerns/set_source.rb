module SetSource
  extend ActiveSupport::Concern

  include do
  before_action :set_source
  end

  def set_source
    sesson[:source] = params[:q] if params[:q]
  end

end
