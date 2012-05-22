# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
require 'dispatcher'

Dispatcher.to_prepare do
    AdminGeneralController.class_eval do
        def stats
            # Overview counts of things
            @public_body_count = PublicBody.count
            
            @info_request_count = InfoRequest.count
            @outgoing_message_count = OutgoingMessage.count
            @incoming_message_count = IncomingMessage.count
            
            @user_count = User.count
            @track_thing_count = TrackThing.count
            
            @comment_count = Comment.count
            @request_by_state = InfoRequest.count(:group => 'described_state')
            @tracks_by_type = TrackThing.count(:group => 'track_type')
        end
    end
end
