# frozen_string_literal: true

class ContentItemsController < SecureController
  def index
    @content_items = current_user.content_items
  end

  def show
    @content_item = ContentItem.find(params[:id])
  end

  def new
    @content_item = ContentItem.new
    @content_item.user = current_user
    @content_item.publishing_targets.build
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

  def edit
    @content_item = ContentItem.find(params[:id])
    @content_item.publishing_targets.build
  end

  def update
    @content_item = ContentItem.find(params[:id])
    @content_item.assign_attributes(content_item_params)

    if @content_item.save
      redirect_to content_items_path, notice: "#{@content_item.title} updated"
    else
      render :edit
    end
  end

  def destroy
    @content_item = current_user.content_items.find(params[:id])
    @content_item.destroy

    redirect_to content_items_path, notice: "#{@content_item.title} deleted"
  end

  def calendar
    @search = ContentItemsSearch.new(params[:search], current_user)
    @publishing_targets = @search.results
  end

  private

  def content_item_params
    params.require(:content_item).permit(:title, :body, publishing_targets_attributes: %i[social_network_id publishing_date])
  end
end
