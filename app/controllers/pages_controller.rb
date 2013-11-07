class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :crate, :edit, :update, :destroy]
  before_action :find_page, except: [:new, :create, :index]

  def show
    #
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page has been created"
      redirect_to root_path
    else
      flash[:alert] = "Could Create page"
      render action: :new
    end
  end

  def edit
    #
  end

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = "Page successfulyy update"
      redirect_to @page
    else
      flash[:alert] = "Could not update page"
      render action: :edit
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Page has been deleted"
    redirect_to root_path
  end

private

  def page_params
    params.require(:page).permit(:title, :content)
  end

  def find_page
    @page = Page.find(params[:id])
  end

  def authorize_admin
    unless current_user.admin?
      flash[:alert] = "You need to be admin to do that"
      redirect_to :back
    end
  end
end
