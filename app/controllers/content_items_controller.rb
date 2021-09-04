
class ContentItemsController < SecureController
  def index
    @content_items = current_user.content_items
  end

  def show
    @content_item = ContentItem.find(params[:id])
  end

  def new
    @content_item = ContentItem.new
  end

  def create
    @content_item = ContentItem.new(content_item_params)
    @content_item.user = current_user

    if @content_item.save
      redirect_to content_items_path, notice: "#{@content_item.title} added"
    else
      render :new
    end
  end

  private

  def content_item_params
    params.require(:content_item).permit(:title, :body)
  end
end
