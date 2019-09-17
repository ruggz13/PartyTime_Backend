class PlaylistSongsController < ApplicationController
    def index
        playlist_songs = PlaylistSong.all
        render json: playlist_songs
    end

    def show
        playlist_song = PlaylistSong.find(params[:id])
        render json: playlist_song
    end

    def create
        playlist_song = PlaylistSong.create(playlist_song_params)
        render json: playlist_song
    end

    def update
        playlist_song = PlaylistSong.find(params[:id])
        playlist_song.update(playlist_params)
        render json: playlist_song
    end

    def destroy
        PlaylistSong.find(params[:id]).destroy
    end

    private

    def playlist_song_params
       params.require(:playlist_song).permit(:song_id, :playlist_id, :vote_count, :queue) 
    end

end
