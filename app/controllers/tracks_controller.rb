class TracksController < ApplicationController

    def new
        @track = Track.new
        render :new
    end

    def create
        @track = Track.new(track_params)

        if @track.save
            redirect_to track_url(@track)
        else
            flash[errors] = @track.errors.full_messages
            render :new
        end
    end

    def show
        @track = Track.find_by(id: params[:id])
        render :show
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render :edit        
    end

    def update
        @track = Track.find_by(id: params[:id])

        if @track.update_attributes(track_params)
            redirect_to track_url(@track)
        else
            flash[errors] = @track.errors.full_messages
            render :edit
        end
    end

    def destroy
        @track = Track.find_by(id: params[:id])
        @track.destroy
        redirect_to bands_url
    end

    private

    def track_params
        params.require(:track).permit(:title, :album_id, :ord, :bonus, :lyrics)
    end

end
