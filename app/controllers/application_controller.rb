class ApplicationController < ActionController::Base
  protect_from_forgery

  # filters are methods provided by rails.  you get controller filters and model filters.
  # a before_filter placed in the application controller will run before an action is called
  # in controllers.  'authenticate_user' is a dynamic method provided by the devise gem.
  # You can run your own custom method before all other actions.  Commented out example below.
  # A link to the documentation on filters and the different ones available
  # http://rails.rubyonrails.org/classes/ActionController/Filters/ClassMethods.html
  before_filter :authenticate_user!
  # before_filter :custom_method
  
  
  # def custom_method
  #   if something.eql?(something_else)
  #     do_something
  #   end
  # end

end
