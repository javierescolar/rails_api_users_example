class Api::UsersController < ApplicationController
	before_action :set_user, only: [:show,:edit,:update, :destroy]
	
	def index
		@users = User.all
		render json: @users
	end

	def show
		render json: @user
	end

	def create
    	@user = User.new(user_params)
      	if @user.save
        	@users = User.all
			render json: @users
      	else
      		@mensaje_error = {"mensaje":"Error al crear usuario"}
      		render json: @mensaje_error
      	end
  	end

  	def destroy
      	if @user.destroy
        	@users = User.all
			render json: @users
      	else
      		@mensaje_error = {"mensaje":"Error al eliminar usuario"}
      		render json: @mensaje_error
      	end
  	end

  	def update
      	if @user.update(user_params)
			render json: @user
      	else
      		@mensaje_error = {"mensaje":"Error al editar usuario"}
      		render json: @mensaje_error
      	end
  	end

	private
		def set_user
	      @user = User.find(params[:id])
	    end

		def user_params
	      params.require(:user).permit(:name , :surnames , :age)
	    end
end
