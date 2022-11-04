class UsersController < ApplicationController
    def index
    end
    
    def show
        @user = User.find(params[:id])
        @gossips = @user.gossips.all
    end  

    def new
        @user = User.new
        @cities = cities_list
    end

    def create
        @user = User.new(post_params)
        if @user.save
            redirect_to :root
        else
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def post_params
        post_params = params.require(:user).permit(:first_name,:last_name,:age,:city_id,:email,:password,:password_confirmation)
    end

    def cities_list
        cities =[]
        City.all.each {|city| cities << city}
        return cities
    end
end
