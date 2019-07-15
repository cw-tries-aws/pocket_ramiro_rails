require 'rails_helper'

RSpec.describe 'as a registered user', :type => :request do
  describe 'when i go to the ticket dashboard' do
    it 'I can add a ticket to the system' do
      User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password_digest:"password", role:0)

      params = {
        "priority": "2",
        "notes": "needs cleaning",
        "table_key": "3",
        "table_name": "Resource",
        "user_id": "1"
      }
      post '/api/v1/resources/3/tickets', params: params
      ticket = Ticket.last
      data = JSON.generate(ticket)

      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq(
        {"status" =>  "201", "body" => {
          "message" => "You have successfully created a ticket."
          }}
      )
    end
  end
end