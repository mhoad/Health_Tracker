class EntriesController < ApplicationController

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry].merge(:user_id => current_user.id))

    if @entry.save
      flash[:notice] = "Keep up the good work"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update  
    @entry = Entry.find(params[:id])
    
    if @entry.update_attributes(params[:entry])
      flash[:notice] = "Entry successfully edited"
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:notice] = "Entry successfully deleted."
    redirect_to entries_path
  end

  def index
    @entries = Entry.paginate(:page => params[:page])
    @user = current_user
  end

  def show
    @entries = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

end
