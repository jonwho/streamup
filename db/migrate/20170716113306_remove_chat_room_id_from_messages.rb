class RemoveChatRoomIdFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :chat_room_id
  end
end
