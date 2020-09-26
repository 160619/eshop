class Admin::RepliesController < AdminController
  def index
    @replies = Reply.all
  end
end
