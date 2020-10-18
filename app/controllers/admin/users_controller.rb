# frozen_string_literal: true

module Admin
  # UsersController
  class UsersController < AdminController
    def index
      @users = User.all
    end
  end
end
