class UsersController < ApplicationController

  before_filter :admin_only

  helper_method :sort_column, :sort_direction

  def index
    @menu='admin'
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path }
    session[:go_to_after_edit] = users_path
    #@users = User.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(2)
    #if mobile_device?
    #  @users = User.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    #else
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)

    #end
  end

  def show
    @user = User.find(params[:id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path }

    session[:go_to_after_edit] = user_path(@user)
    
    #return_path = user_path(@user)  # !!! perhaps a system vide helper ?
    
  end
  
  def new
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, "Users" => users_path }
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @user.name.capitalize => user_path(@user) }
    
  end


  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to admin_index_path
    #create! do |success, failure|
    #  success.html do
    #    unless current_user
    #      # log users created by themself in 
    #       user = User.authenticate(@user.email, @user.password)
    #       cookies[:auth_token] = user.auth_token
    #       session[:user_id] = user.id
    #    end
    #
    #    if params[:user][:image]
    #      redirect_to crop_user_path(@user), :notice => "User created!"
    #    else
    #      #if mobile_device?
    #      #  redirect_to users_url
    #      #else
    #        redirect_to admin_index_path, :notice => "User created!"
    #      #end
    #    end
    #  end
    #  #flash.error = "You are fuckd!"
    #  failure.html { render 'new' }
    #end
  end
  
  def update
    remove_password_fields_if_blank! params[:user]
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if params[:user][:image] && params[:user][:remove_image] != '1'
      redirect_to crop_user_path @user
    else
      redirect_to  admin_index_path 
    end
  end

  
  def crop
    @user = User.find(params[:id])
    @crop_version = (params[:version] || :thumb).to_sym
    @user.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = AvatarUploader.version_dimensions[@crop_version]
    
  end

  def crop_update
    @user = User.find(params[:id])
    @user.crop_x = params[:user]["crop_x"]
    @user.crop_y = params[:user]["crop_y"]
    @user.crop_h = params[:user]["crop_h"]
    @user.crop_w = params[:user]["crop_w"]
    @user.crop_version = params[:user]["crop_version"]
    @user.save
    
    goto = session.delete(:go_to_after_edit) || root_path
    redirect_to goto
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_index_path 
  end
  
  
private

  def remove_password_fields_if_blank!(user_params)
    if user_params[:password].blank? and user_params[:password_confirmation].blank?
      user_params.delete :password
      user_params.delete :password_confirmation
    end
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  
  private
    def user_params

      params.require(:user).permit!

    end
end
