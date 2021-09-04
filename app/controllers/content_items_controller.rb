
class ContentItemsController < SecureController
  def index
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
