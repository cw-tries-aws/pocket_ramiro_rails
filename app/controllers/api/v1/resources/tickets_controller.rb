class Api::V1::Resources::TicketsController < ApplicationController
  before_action :current_user

  def index
    results = Ticket.tickets_by_resource(params["resource_id"].to_i)
    render json: results
  end

  def create
    ticket = Ticket.new(resource_ticket_params)
    if ticket.save
      render json: ticket
    else
        render json: {status: "406",
        body: {
          "message": "Unable to create your ticket."
          }}
    end
  end

  def show
    ticket = Ticket.find(params["ticket_id"].to_i)
    render json: ticket
  end

  def update
    ticket = Ticket.find_by(id: params[:id])
    if ticket
      ticket.update(resource_ticket_params)
      updated_ticket = Ticket.find(params[:id])
      render json: updated_ticket
    else
      render json: {
        "Error": "Resource ticket does not exist."
      }
    end
  end

private
  def resource_ticket_params
    params.permit(:table_key, :table_name, :priority, :notes, :user_id, :frequency_unit, :frequency_value, :active)
  end

end
