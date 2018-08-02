class MessagesController < ApplicationController
  before_action :find_message, only: [:edit, :update, :show, :destroy]
   
  def index
      @messages = Message.all.order("created_at DESC")
      # NOTE: this is messages like in laravel in 
      # index plural in other function it is singular
    end
    
    def new
      @message = Message.new
    end
    
    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to root_path
      else
        render 'new'
      end
    end
    # there is @message only in new,create etc bec in _form.html.erb there is
    # <%= simple_form_for @message do |f| %> and we are using it in create,new
    def edit     
    end
    
    def update    
      if @message.update(message_params)
        redirect_to message_path
      else
        render 'new'
      end
    end
    
    def show
    end
    
    def destroy 
      @message.destroy
      redirect_to root_path   
    end

    private
      def message_params
        params.require(:message).permit(:title, :description)
      end
    
      def find_message
        @message = Message.find(params[:id])
      end
    
end
