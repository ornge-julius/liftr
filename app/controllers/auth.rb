Liftr::App.controllers :auth do
	get :login do 
		render "/auth/login"
	end

	post :create do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect url(:lifts, :index)
    elsif Padrino.env == :development && params[:bypass]
      account = Account.first
      set_current_account(account)
      redirect url(:lifts, :index)
    else
      params[:email] = h(params[:email])
      flash.now[:error] = pat('login.error')
      render "/auth/login", nil, :layout => false
    end
  end

  delete :destroy do
    set_current_account(nil)
    redirect url(:auth, :login)
  end
end