class FoliosController < ApplicationController
  def index
    @folio_items = Folio.all
  end
end
