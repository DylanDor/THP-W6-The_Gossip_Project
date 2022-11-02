class GossipController < ApplicationController

    def index
        @gossips = Gossip.all
    end


    def show
        @gossip = Gossip.find(params[:id])
        @comments = @gossip.comments
        puts @comments
    end

    def new
        @gossip = Gossip.new
    end

    def create
        @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 4)
  
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
end
