class ComentsController < ApplicationController
  def new
    @coment = Coment.new
  end

  def create
    @coment = Coment.new(coment_param)
    if @coment.save
      redirect_to topics_path,success: "コメントに成功しました。"
    else
      flash.now[:danger] = "コメントに失敗しました。"
      render :new
    end
  end

  private
  def coment_param
    params.require(:coment).permit(:content,:topic_id)
  end
end
