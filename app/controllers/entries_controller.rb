class EntriesController < ApplicationController

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])

    if @entry.save
      flash[:success] = "Keep up the good work"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update  
    @entry = Entry.find(params[:id])
    
    if @entry.update_attributes(params[:entry])
      flash[:success] = "Entry successfully edited"
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:success] = "Entry successfully deleted."
    redirect_to entries_path
  end

  def index
    @entries = Entry.paginate(:page => params[:page])
  end

  def show
    @entries = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

end
