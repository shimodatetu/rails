class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    if params[:check] == "true"
      favorite = Favorite.new
      favorite.user_id = current_user.id
      favorite.topic_id = params[:topic_id]
      if favorite.save
        topic = Topic.find_by(id:params[:topic_id])
        if topic.good_num.nil?
          topic.good_num = 1
        else
          topic.good_num += 1
        end
        if topic.save
          redirect_to topics_path, success: "お気に入り登録しました"
        end
      else
        redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
      end
    else
      fav = Favorite.find_by(topic_id:params[:topic_id])
      if fav.delete
        topic = Topic.find_by(id:params[:topic_id])

        if topic.good_num.nil?
          topic.good_num = 0
        else
          topic.good_num -= 1
        end
        if topic.save
          redirect_to topics_path, danger: "お気に入りに登録を外しました"
        end
      end
    end
  end
end
