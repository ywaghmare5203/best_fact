class FactController < ApplicationController
  def home
    @fact = Fact.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
    @facts = Fact.new
    respond_to do |format|
      format.json {render :json => @fact}
      format.xml {render :xml => @fact}
      
   # render :layout => "home"
  end
  end

  def demo
    render :layout => "home"
  end

  def create
  @fact = Fact.create(fact_params)
    if @fact.save
      redirect_to root_url
    else
      render root_url
    end
  end

  def edit
    @edit = Fact.find_by_id(params[:id])
    render :layout => "home"
  end

  def update
    @update = Fact.find_by_id(params[:id])
    @update.update_attributes(fact_params)
    if @update.save
      redirect_to root_url
    else
      render "edit"
    end
   
  end

  def delete
    @delete = Fact.find_by_id(params[:id])
    if @delete.destroy
      redirect_to root_url
    else
      render "home"
    end
  end

  private

  def fact_params
    params.require(:fact).permit(:id ,:title, :content, :author,:fact_image)
  end
end
