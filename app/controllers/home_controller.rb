class HomeController < ApplicationController
    def index
        redirect_to companies_path if user_signed_in?
    end
end
