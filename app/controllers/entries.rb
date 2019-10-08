Liftr::App.controllers :entries do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  post :create do

  end

  get :all do
    @entries = Entry.all
    @entries.to_json
  end

  get :index, :with => :id do
    @entry = Entry.first({id: params[:id]})
    @entry.to_json
  end

end
