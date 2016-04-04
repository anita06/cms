class AdminUsersController < ApplicationController

  layout "admin"
  before_action :confirmed_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new({:first_name => "Default"})
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = "User Created Successfully"
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end


  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin User Updated Successfully"
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin User Destroyed  Successfully"
    redirect_to(:action => 'index')
  end


  private

  def admin_user_params
    # same as using "params[:subject]", except that it:
    #  - raises an error if :subject is not present
    #  - allows listed attributes to be mass-assigned
    params.require(:admin_user).permit(:first_name, :last_name, :username, :email, :password)
  end

end
