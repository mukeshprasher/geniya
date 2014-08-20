module ResponsesHelper
  def clear_notifications
    if current_user and controller_name != "main"
      obj = controller_name.classify.constantize.find(params[:id])
      if obj
        responses = Response.where(user_id: current_user.id, acted_upon_type: controller_name.classify, acted_upon_id: obj.id)
        responses.each{|r| r.destroy}
      end
    end
  end
end
