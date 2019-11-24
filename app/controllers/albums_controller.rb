class AlbumsController < ApplicationController

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            flash[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
        if @album.nil?
            redirect_to bands_url
        else

            render :show
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        render :edit
    end

    def update
        @album = Album.find_by(id: params[:id])

        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            flash[:errors] = @album.errors.full_messages
            render :index
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @album.destroy
        redirect_to bands_url
    end

    private

    def album_params
        params.require(:album).permit(:title, :year, :live, :band_id)
    end

end
