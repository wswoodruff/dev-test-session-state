class SessionsController < AuthenticationsController

  def new
      @session = Session.new
  end

  def create
    if login(params[:email], params[:password])

      @session = Session.create(:ip_address => request.remote_ip, :user => current_user)

      flash[:success] = 'Welcome back!'
      redirect_to root_path
    else
      flash.now[:warning] = 'E-mail and/or password is incorrect.'
      render 'new'
    end
  end

  def destroy
    logout

    flash[:success] = 'See you!'
    redirect_to log_in_path
  end
end
