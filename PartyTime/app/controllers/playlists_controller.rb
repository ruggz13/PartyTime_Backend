class PlaylistsController < ApplicationController

    def index
        playlists = Playlist.all
    end

    def show
        playlist = Playlist.find(params[:id])
    end

    def create
        playlist = Playlist.create(playlist_params)
        render json: playlist
    end

    def update
        playlist = Playlist.find(params[:id])
        playlist.update(playlist_params)
        render json: playlist
    end

    def destroy
        Playlist.find(params[:id]).destroy
    end

    private

    def playlist_params
       params.require(:playlist).permit(:song_id, :user_id, :title, :description) 
    end
end
