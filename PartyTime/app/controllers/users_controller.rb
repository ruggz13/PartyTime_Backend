class UsersController < ApplicationController

   

    def create

        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        user = User.find_by( spotify_id: spotify_user.id)
        if user == nil
            user = User.create(first_name: spotify_user.display_name.split(" ")[0], last_name: spotify_user.display_name.split(" ")[1], username: spotify_user.display_name, email: spotify_user.email, spotify_id: spotify_user.id, followers: spotify_user.followers.total)
        end
        
        auth_params = {id: user.id, first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, spotify_id: user.spotify_id, followers: user.followers, access_token: spotify_user.credentials.token, refresh_token: spotify_user.credentials.refresh_token}
        # user.access_token = spotify_user.credentials.access_token 
        # user.refresh_token = spotify_user.credentials.refresh_token
        redirect_to "http://localhost:3000/#" + auth_params.to_query
        # render json: spotify_user.to_hash
        
        # Now you can access user's private data, create playlists and much more
    
        # # Access private data
        # spotify_user.country #=> "US"
        # spotify_user.email   #=> "example@email.com"
    
        # # Create playlist in user's Spotify account
        # playlist = spotify_user.create_playlist!('my-awesome-playlist')
    
        # # Add tracks to a playlist in user's Spotify account
        # tracks = RSpotify::Track.search('Know')
        # playlist.add_tracks!(tracks)
        # playlist.tracks.first.name #=> "Somebody That I Used To Know"
    
        # # Access and modify user's music library
        # spotify_user.save_tracks!(tracks)
        # spotify_user.saved_tracks.size #=> 20
        # spotify_user.remove_tracks!(tracks)
    
        # albums = RSpotify::Album.search('launeddas')
        # spotify_user.save_albums!(albums)
        # spotify_user.saved_albums.size #=> 10
        # spotify_user.remove_albums!(albums)
    
        # # Use Spotify Follow features
        # spotify_user.follow(playlist)
        # spotify_user.follows?(artists)
        # spotify_user.unfollow(users)
    
        # # Get user's top played artists and tracks
        # spotify_user.top_artists #=> (Artist array)
        # spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)
    
        # Check doc for more
      end

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        User.find(params[:id]).destroy
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email)
    end
end
