class GossipController < ApplicationController
    before_action :authenticate_user, only: [:new, :create]
    before_action :super_user , only: [:edit,:update,:destroy]

    def index
        @gossips = Gossip.all
    end


    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end

    def create
        @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])
  
        if @gossip.save
            flash[:success]
            redirect_to :root
        else 
            flash[:alert]
            render :new
        end 
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        @gossip = Gossip.find(params[:id])
        if @gossip.update(post_params)
            redirect_to gossip_path(params[:id])
        else
            render :edit
        end
    end

    def destroy
        50.times do puts "#" end
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to :root
    end

    private
    
    def post_params
        post_params = params.require(:gossip).permit(:title, :content)
    end

    def authenticate_user
        unless session[:user_id]
            flash[:danger] = "Please log in."
            redirect_to new_session_path
        end
    end

    def super_user
        unless session[:user_id] == Gossip.find(params[:id]).user
          flash[:danger] = "Vous n'êtes pas le créateur de ce potin....Si oui, prouvez le"
          redirect_to :root
        end
      end
end
