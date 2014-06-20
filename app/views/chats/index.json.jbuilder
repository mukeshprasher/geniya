json.array!(@chats) do |chat|
  json.extract! chat, :id, :user_id, :reciever_id, :message, :status
  json.url chat_url(chat, format: :json)
end
