Liftr::App.controllers :lifts do
  
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
  
  get :index do
    @lifts = Lift.all.sort_by{ |lift| lift.name}
    @title = "Liftr"
    #binding.pry
    render 'lifts/index'
  end

  get :index, :with => :id do
    @lift = Lift.first({'id': params[:id]})
    @entries = @lift.entries.sort_by{ |ent| ent.date }.reverse
    #binding.pry
    render 'lifts/lift'
  end

  post :create do
    @lift = Lift.new(:name => params[:array][:name], :user_id => 1)
    if @lift.save
      flash[:success] = "Lift created"
      redirect(url(:lifts, :index))
    else 
      flash.now[:error] = "An error occured"
      render 'lifts/index'
    end
  end

  #Cascade deletes fail
  post :destroy, :with => :id do
    @lift = Lift.first({'id': params[:id]})
    if @lift.destroy
      flash[:success] = "Lift deleted"
      redirect(url(:lifts, :index))
    else 
      flash.now[:error] = "An error occured"
      render 'lifts/index'
    end
  end
end
