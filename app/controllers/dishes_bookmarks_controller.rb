class DishesBookmarksController < ApplicationController
  def index
    @q = DishesBookmark.ransack(params[:q])
    @dishes_bookmarks = @q.result(:distinct => true).includes(:dish, :bookmark).page(params[:page]).per(10)

    render("dishes_bookmarks/index.html.erb")
  end

  def show
    @dishes_bookmark = DishesBookmark.find(params[:id])

    render("dishes_bookmarks/show.html.erb")
  end

  def new
    @dishes_bookmark = DishesBookmark.new

    render("dishes_bookmarks/new.html.erb")
  end

  def create
    @dishes_bookmark = DishesBookmark.new

    @dishes_bookmark.dish_id = params[:dish_id]
    @dishes_bookmark.bookmark_id = params[:bookmark_id]

    save_status = @dishes_bookmark.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes_bookmarks/new", "/create_dishes_bookmark"
        redirect_to("/dishes_bookmarks")
      else
        redirect_back(:fallback_location => "/", :notice => "Dishes bookmark created successfully.")
      end
    else
      render("dishes_bookmarks/new.html.erb")
    end
  end

  def edit
    @dishes_bookmark = DishesBookmark.find(params[:id])

    render("dishes_bookmarks/edit.html.erb")
  end

  def update
    @dishes_bookmark = DishesBookmark.find(params[:id])

    @dishes_bookmark.dish_id = params[:dish_id]
    @dishes_bookmark.bookmark_id = params[:bookmark_id]

    save_status = @dishes_bookmark.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes_bookmarks/#{@dishes_bookmark.id}/edit", "/update_dishes_bookmark"
        redirect_to("/dishes_bookmarks/#{@dishes_bookmark.id}", :notice => "Dishes bookmark updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dishes bookmark updated successfully.")
      end
    else
      render("dishes_bookmarks/edit.html.erb")
    end
  end

  def destroy
    @dishes_bookmark = DishesBookmark.find(params[:id])

    @dishes_bookmark.destroy

    if URI(request.referer).path == "/dishes_bookmarks/#{@dishes_bookmark.id}"
      redirect_to("/", :notice => "Dishes bookmark deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dishes bookmark deleted.")
    end
  end
end
