class FoliosController < ApplicationController
  before_action :set_folio_items, only: [:edit, :update, :show, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  layout 'folio'

  def index
    @folio_items = Folio.by_position
  end

  def sort
    params[:order].each do |key, value|
      folio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def new
    @folio_item = Folio.new
    3.times { @folio_item.technologies.build }
  end

  def create
    @folio_item = Folio.new(folio_item_params)

    respond_to do |format|
      if @folio_item.save
        format.html { redirect_to folios_path, notice: 'Your portfolio has been created' }
      else
        format.html { render :new }
      end
    end

  end

  def edit
    3.times { @folio_item.technologies.build }
  end

  def update
    respond_to do |format|
      if @folio_item.update(folio_item_params)
        format.html { redirect_to folios_path, notice: 'Your portfolio has been updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show

  end

  def destroy

    # Destroy/Delete the record
    @folio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to folios_url, notice: 'Your portfolio was successfully deleted.' }
    end
  end

  private

  def folio_item_params
    params.require(:folio).permit(:title,
                                  :subtitle,
                                  :body,
                                  :main_image,
                                  :thumb_image
                                  # :technologies_attributes [:id, :name]
                                )
  end

  def set_folio_items
    @folio_item = Folio.find(params[:id])
  end
end
