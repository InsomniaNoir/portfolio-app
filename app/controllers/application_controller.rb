class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :set_source

  def set_source
    sesson[:source] = params[:q] if params[:q]
  end
end
