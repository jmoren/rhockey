class ReferisController < ApplicationController
  def index
    @referis = Referi.all
  end
  
  def show
    @referi = Referi.find(params[:id])
  end
  
  def new
    @referi = Referi.new
  end
  
  def create
    @referi = Referi.new(params[:referi])
    if @referi.save
      flash[:notice] = "Successfully created referi."
      redirect_to @referi
    else
      render :action => 'new'
    end
  end
  
  def edit
    @referi = Referi.find(params[:id])
  end
  
  def update
    @referi = Referi.find(params[:id])
    if @referi.update_attributes(params[:referi])
      flash[:notice] = "Successfully updated referi."
      redirect_to @referi
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @referi = Referi.find(params[:id])
    @referi.destroy
    flash[:notice] = "Successfully destroyed referi."
    redirect_to referis_url
  end
end
