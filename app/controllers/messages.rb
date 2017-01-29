Messages::App.controllers :messages do


  get :new, :map => '/new' do
    @message = Message.new
    render 'messages/new'
  end

  get :show, :map => 'message/:id' do
    @message = Message.find_by(id: params[:id])
    render 'messages/show'
  end

  post :create, :map => '/create'  do
   @message = Message.new(description: params[:message][:description])
   @message.save
   render 'messages/new'
 end

  delete :destroy do

  end
end


