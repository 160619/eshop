# frozen_string_literal: true

module Admin
  # RepliesController
  class RepliesController < AdminController
    def index
      @replies = Reply.all
    end
  end
end
