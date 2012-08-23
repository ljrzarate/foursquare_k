class FoursquareController < ApplicationController

  before_filter :require_user
   
  def profile_user
  end

   def search_user

       if (params[:option] == "Email")
        @user = foursquare.search_users(:email => params[:value])
       else
        if (params[:option] == "Twitter")
          @user =  foursquare.search_users(:twitter => params[:value])
        else
          if (params[:option] == "Name")
          @user =  foursquare.search_users(:name => params[:value])
        else
          if (params[:option] == "Phone")
          @user =  foursquare.search_users(:phone => params[:value])
        end
      end
      end
     end 
  end

  
  def search_venues
    if(params[:name])
      @venues = foursquare.search_venues(:query => params[:name], :ll => "10.971949,-74.796638")
    end
  end


  def search_friends
    if(params[:email])
    @user_found = foursquare.search_users(:email => params[:email])     
    
    if(@user_found.results.size > 0 )then
    @friends_found = foursquare.user_friends(@user_found.results[0]["id"])
    end
    end    
  end

  
  def search_tips
      
      if(params[:name])
      @venue = foursquare.search_venues(:query => params[:name], :ll => "10.971949,-74.796638",:limit => 1)
      
      if(@venue.groups[0]["items"].size > 0 ) then
      @tips = foursquare.venue_tips(@venue.groups[0]["items"][0]["id"])
      end
      end
  
  end

end
