class SubsController < ApplicationController
  def index
    @subs = sub.all
  end

  def show
    @sub = Sub.find(params([:id])
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      ridirect_to subs_path
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

  private
    def sub params
      params.require(:model_name).permit(name) #go to schema to see which attributes the model has
    end
end
