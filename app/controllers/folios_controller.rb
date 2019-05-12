class FoliosController < ApplicationController
  def index
    @folio_items = Folio.all
  end

  def new
    @folio_item = Folio.new
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
    @folio_item = Folio.find(params[:id])
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

  private

  def folio_item_params
    params.require(:folio).permit(:title, :subtitle, :body)
  end
end
