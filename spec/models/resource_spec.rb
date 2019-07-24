require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }

  end

  describe 'relationships' do
    it { should have_many :resource_parts }
    it { should have_many(:parts).through(:resource_parts) }
    it { should belong_to :resource_type }
    it { should belong_to :user }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
    before :each do
      Resource.destroy_all
      User.destroy_all
      ResourceType.destroy_all
      @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
      @resource1 = @r_type1.resources.create(name: "Bright Tank 1", cost:20000.00, user_id: 1, created_at: "2008-02-09 16:49:29", updated_at: "2008-02-09 16:49:29", active: true,id: 1)
      @resource2 = @r_type1.resources.create(name: "Bright Tank 2", cost:10000.00, user_id: 1, created_at: "2007-12-29 13:13:04", updated_at: "2007-12-29 13:13:04", active: true,id: 2)
      @resource3 = @r_type1.resources.create(name: "Bright Tank 4", cost:10000.00, user_id: 1, created_at: "2013-12-22 4:11:33", updated_at: "2018-12-22 4:11:33", active: false,id: 3)
      @resource4 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 4:11:33", updated_at: "2018-12-22 4:11:33", active: false,id: 4)
      @resource5 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 5:11:33", updated_at: "2018-12-22 5:11:33", active: false,id: 5)
      @resource6 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 6:11:33", updated_at: "2018-12-22 6:11:33", active: false,id: 6)
      @resource7 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 7:11:33", updated_at: "2018-12-22 7:11:33", active: false,id: 7)
      @resource8 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 8:11:33", updated_at: "2018-12-22 8:11:33", active: false,id: 8)
      @resource9 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 9:11:33", updated_at: "2019-12-22 9:11:33", active: false,id: 9)
      @resource10 = @r_type1.resources.create(name: "Bright Tank 3", cost:10000.00, user_id: 1, created_at: "2013-12-22 10:11:33", updated_at: "2019-12-22 10:11:33", active: false,id: 10)
      @ticket1 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs oil change", priority:1, active: true, id:1, status: 1, updated_at: "2019-11-1 9:00:00.33")
      @ticket2 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs new transmission", priority:3, active: true, id:2, status: 1, updated_at: "2019-11-1 9:00:00.33")
      @ticket3 = Ticket.create(table_key: 3, table_name: "Resources", user_id:1, notes:"needs oil change", priority:3, active: true, id:3, status: 1, updated_at: "2019-07-01 1:00:00.33")
      @ticket4 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs new transmission", priority:3, active: true, id:4, status: 1, updated_at: "2019-11-1 9:00:00.33")
      @ticket5 = Ticket.create(table_key: 5, table_name: "Resources", user_id:1, notes:"needs oil change", priority:3, active: true, id:5, status: 1, updated_at: "2019-07-01 1:00:00.33")
      @ticket6 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs new transmission", priority:3, active: true, id:6, status: 1, updated_at: "2019-11-1 9:00:00.33")
      @ticket7 = Ticket.create(table_key: 7, table_name: "Resources", user_id:1, notes:"needs oil change", priority:3, active: true, id:7, status: 2, updated_at: "2019-07-01 1:00:00.33")
      @ticket8 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs new transmission", priority:3, active: true, id:8, status: 1, updated_at: "2019-11-1 9:00:00.33")
      @ticket9 = Ticket.create(table_key: 9, table_name: "Resources", user_id:1, notes:"needs oil change", priority:2, active: true, id:9, status: 2, updated_at: "2019-07-01 1:00:00.33")
      @ticket10 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs new transmission", priority:3, active: true, id:10, status: 1, updated_at: "2019-11-1 9:00:00.33")
      @ticket11 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs oil change", priority:1, active: true, id:11, status: 2, updated_at: "2019-07-01 1:00:00.33")
      @ticket12 = Ticket.create(table_key: 1, table_name: "Resources", user_id:1, notes:"needs new transmission", priority:3, active: true, id:12, status: 1, updated_at: "2019-11-1 9:00:00.33")


    end
    describe '.all_active_resource' do
      it 'returns active resources' do
        expect(Resource.all_active_resources).to eq([@resource1, @resource2])
        expect(Resource.all_active_resources).to_not eq([@resource3])
      end
    end
    describe '.all_with_tickets' do
      it 'can return a flag on resources that have an open ticket' do
        results = Resource.all_with_tickets
        expect(results[0]["open_ticket"]).to eq(1)
        expect(results[0]["priority"]).to eq(1)
        expect(results[0]["table_name"]).to eq("Resources")
      end
    end
    describe '.high_volume_tickets' do
      it 'can return resources with the most tickets' do
        results = Resource.high_volume_tickets

        expect(results[0]["name"]).to eq("Bright Tank 1")
        expect(results[0]["id"]).to eq(1)
        expect(results[0]["number_tickets"]).to eq(8)
      end
    end
    describe '.perc_urgent_tickets' do
      it 'can return % resources with urgent tickets' do
        results = Resource.perc_urgent_tickets
        expect(results[0]["perc_urgent_tickets"]).to eq("0.70588235294117647059")
      end
    end
    describe '.fulfilled_tickets' do
      it 'can return % resources with urgent tickets' do
        results = Resource.fulfilled_tickets
        expect(results[0]["fulfilled_tickets"]).to eq("0.25000000000000000000")
      end
    end
    describe '.fulfilled_tickets_monthly' do
      it 'can return % resources with urgent tickets' do
        results = Resource.fulfilled_tickets_monthly(7, 2019)
        expect(results[0]["fulfilled_tickets"]).to eq("0.60000000000000000000")
      end
    end
  end
end
