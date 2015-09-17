class DramasController < ApplicationController

  before_action :set_drama, :only=>[:show, :edit, :update, :destory]

  def index
    @dramas = Drama.all
  end

  def new
    @drama = Drama.new
  end

  def create
    @drama = Drama.new(drama_params)
    if @drama.save
    flash[:notice] = "新增成功"
    redirect_to dramas_path
    else
    render :action => :new
    end
  end

  def show
    @page_title = @drama.name
  end

  def edit
  end

  def update
    @drama.update(drama_params)
    if @drama.update(drama_params)
    flash[:notice] = "編輯成功"
    redirect_to drama_path(@drama)
    else
    render :action => :edit
    end
  end

  def destroy
    @drama.destroy
    flash[:notice] = "刪除成功"
    redirect_to dramas_path
  end



  private

  def drama_params
    params.require(:drama).permit(:name, :description, :actor, :set, :time)
  end

  def set_drama
    @drama = Drama.find(params[:id])
  end

end
