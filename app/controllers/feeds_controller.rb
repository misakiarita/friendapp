class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy]

  def index
    @feeds = Feed.all
  end

  # GET /feeds/1 or /feeds/1.json
  def show
    @feed = Feed.find(params[:id])
  end

  # GET /feeds/new
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = current_user.feeds.build(feed_params)
    render :new if @feed.invalid?
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds or /feeds.json
  def create
    @feed = Feed.new(feed_params)
    @feed = current_user.feeds.build(feed_params)
    if params[:back]
      render :new
    else

      if @feed.save
        redirect_to new_feed_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  
  # def create
    
  #   @feed = Feed.new(params[:id])

  #   respond_to do |format|
  #     if @feed.save
  #       format.html { redirect_to feed_url(@feed), notice: "Feed was successfully created." }
  #       format.json { render :show, status: :created, location: @feed }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @feed.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /feeds/1 or /feeds/1.json
#   def update
#     @feed = Feed.find(params[:id])
#     if @feed.update(feed_params)
#         redirect_to feed_path, notice: "Your feed was edited!"
#     else
#         render :edit
#     end
# end
  def update
    respond_to do |format|
      if @feed.update(params[:id])
        format.html { redirect_to feed_path, notice: "Feed was successfully updated." }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1 or /feeds/1.json
  def destroy
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url, notice: "Feed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end
  

    # Only allow a list of trusted parameters through.
    def feed_params
      params.require(:feed).permit(:image, :image_cache, :title, :content)
    end
end
