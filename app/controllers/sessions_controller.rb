class SessionsController < ApplicationController
    
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            puts "yes"
            redirect_to :root
        else
            puts "aled"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to :root
    end

end
