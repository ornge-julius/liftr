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
  
  #TODO Make sure in prod you backload entries with dates
  post :create, :with => :lift_id do
    @lift = Lift.first({'id': params[:lift_id]})
    @entry = Entry.new(:lift_id => params[:lift_id], :weight => params[:entry][:weight].to_i, :date => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    if @entry.save
      flash[:success] = "Lift created"
      redirect(url(:lifts, :index, :id => @lift.id))
    else 
      flash.now[:error] = "An error occured"
      render 'lifts/' + @lift.id.to_s
    end
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
