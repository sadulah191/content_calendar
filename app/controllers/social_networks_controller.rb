class SocialNetworksController < SecureController
  def index
  end

  def new
    @social_network = SocialNetwork.new
  end

  def create
    @social_network = SocialNetwork.new(social_network_params)
    @social_network.user = current_user

    if @social_network.save
      redirect_to social_networks_path, notice: "#{@social_network.description} added"
    else
      render :new
    end
  end

  private

  def social_network_params
    params.require(:social_network).permit(:description)
  end
end
