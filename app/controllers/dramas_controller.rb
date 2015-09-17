class DramasController < ApplicationController

  before_action :set_drama, :only=>[:show, :edit, :update, :destroy]

  def index
    @dramas = Drama.page(params[:page]).per(10)

      respond_to do|format|
      format.html
      format.xml{render :xml => @dramas.to_xml}
      format.json{render :json => @dramas.to_json}
    end
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
    respond_to do|format|
    format.html{ @page_title = @drama.name }
    format.xml{render :xml => @drama.to_xml}
    format.json{render :json => @drama.to_json}
    end
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
    flash[:alert] = "刪除成功"
    redirect_to dramas_path
  end



  private

  def drama_params
    params.require(:drama).permit(:name, :description, :actor, :set, :time, :day)
  end

  def set_drama
    @drama = Drama.find(params[:id])
  end

end
