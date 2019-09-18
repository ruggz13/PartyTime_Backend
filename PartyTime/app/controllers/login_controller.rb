class LoginController < ApplicationController

    def create 

        query_params = {
            client_id: ENV['client_id'],
            response_type: "code",
            redirect_uri: 'http://localhost:3001/auth/spotify/callback',
            scope: 'user-read-email playlist-modify-public user-library-read user-library-modify',
            show_dialog: true
        }

        url = "https://accounts.spotify.com/authorize"

        redirect_to "#{url}?#{query_params.to_query}"

    end


end