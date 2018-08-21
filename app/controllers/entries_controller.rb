class EntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :show, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    return render :new unless @entry.save
    redirect_to @entry, notice: 'Entry creation succeeded.'
  end

  def update
    return render :edit unless @entry.update(entry_params)
    redirect_to @entry, notice: 'Entry update succeeded.'
  end

  def destroy
    @entry.destroy!
    redirect_to entries_path
  end

  private
  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(
        :title,
        :body
    )
  end
end
