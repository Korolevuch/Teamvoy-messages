Messages::App.controllers :messages do


  get :new, :map => '/new' do
    @message = Message.new
    render 'messages/new'
  end

  get :show, :map => 'message/:id' do
    message = Message.find_by(id: params[:id])
    @message = AESCrypt.decrypt(message.description, '123')
    render 'messages/show'
  end

  post :create, :map => '/create'  do
   @message = Message.new(description: AESCrypt.encrypt(params[:message][:description], '123'))
   if @message.save
    redirect(:new)
  else
    render 'messages/new'
   end
  end

  delete :destroy do

  end
end
