 Messages::App.controllers :messages do
  layout 'application'

  before :show do
   @message = Message.friendly.find(params[:id])
   @message.count_visit += 1
   @message.save
  end

  get :new, :map => '/' do
    @message = Message.new
    render 'messages/new'
  end

  get :show, :map => 'messages/:id' do
    unless id_is_numeric?(params[:id])
      message = Message.friendly.find(params[:id])
      @message = AESCrypt.decrypt(message.description, '123')
      render 'messages/show'
    else
      render 'messages/404'
    end
  end

  post :create, :map => '/create'  do
   @message = Message.new(description: AESCrypt.encrypt(params[:message][:description], '123'), exstraction: params[:message][:exstraction])
   if @message.save
    redirect("messages/#{@message.slug}")
  else
    render 'messages/new'
   end
  end
end
