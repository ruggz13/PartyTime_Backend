class EventsController < ApplicationController
    def index
        events = Event.all
        render json: events
    end

    def show
        event = Event.find(params[:id])
        render json: event
    end

    def create
            playlist = Playlist.find_or_create_by(playlist_params)
            event = Event.new(event_params)
            event.playlist = playlist
            event.save
            render json: event
    end

    def update
        event = Event.find(params[:id])
        event.update(event_params)
        render json: event
    end

    def destroy
        Event.find(params[:id]).destroy
    end

    private

    def event_params
       params.permit(:name, :host, :venue) 
    end

    def playlist_params
        params.permit(:spotify_id, :user_id, :title) 
     end
end
