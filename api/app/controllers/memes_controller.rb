class MemesController < ApplicationController
# Controller Code

before_action :set_meme, only: [:show, :update, :destroy]

# GET /memes
def index
  @memes = Meme.all

  render json: @memes
end

# GET /memes/1
def show
  render json: @meme
end

# POST /memes
def create
  @meme = Meme.new(meme_params)
  @meme.post_time = Datetime.now

  if @meme.save
    render json: @meme, status: :created, location: @meme
  else
    render json: @meme.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /memes/1
def update
  if @meme.update(meme_params)
    render json: @meme
  else
    render json: @meme.errors, status: :unprocessable_entity
  end
end

# DELETE /memes/1
def destroy
  @meme.destroy
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_meme
    @meme = Meme.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def meme_params
    params.permit(:station_id, :user_id, :post_time, :e1_like, 
                  :e2_like, :e3_like, :e4_like, :image_url)
  end
end