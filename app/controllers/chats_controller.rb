class ChatsController < InheritedResources::Base

  private

    def chat_params
      params.require(:chat).permit(:name, :number_phone, :status)
    end
end
