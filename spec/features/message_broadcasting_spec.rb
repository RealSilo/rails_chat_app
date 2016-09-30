require 'rails_helper'

feature "broadcasting message" do
  include ActiveJob::TestHelper
  let(:user) { create(:user) }
  let(:posting_user) { create(:user) }
  let(:chatroom) { create(:chatroom, owner: user, name: "group chatroom", private_chatroom: false) }
  let!(:chatroom_user) { create(:chatroom_user, chatroom: chatroom, user: user) }
  let!(:post_chatroom_user) { create(:chatroom_user, chatroom: chatroom, user: posting_user) }

  scenario "successfully", :js => true do
    sign_in(user)
    visit chatroom_path(chatroom)
    expect(page).not_to have_content("this is a message")
    message = Message.create(body: "this is a message", user: other_user, chatroom: chatroom)
    MessageRelayJob.perform_now(message)
    #fill_in "message[body]", with: "this is a message"
    #find('#new_message').native.send_keys(:return)
    expect(page).to have_content("this is a message")
  end
end