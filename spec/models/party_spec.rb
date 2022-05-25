require "rails_helper"

describe Party, type: :model do
  describe "relationships" do
    it { should have_many(:invitations) }
    it { should have_many(:users).through(:invitations) }
  end

  describe "instance methods" do
    before do
      @user1 = User.create!(name: "User One", email: "user1@test.com", password: "test123", password_confirmation: "test123")
      @party_1 = Party.create!(event_date: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), user_id: @user1.id, movie_id: 24021)
      @party_2 = Party.create!(event_date: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), user_id: @user1.id, movie_id: 809)
    end

    context "#movie" do
      it "returns movie details poros", :vcr do
        movie = @party_1.movie

        expect(movie).to be_a Movie
        expect(movie.title).to eq("The Twilight Saga: Eclipse")
        expect(movie.title).not_to eq("Shrek 2")
      end
    end

    context "#format_start_time" do
      it "returns a formatted start time and date" do
        expect(@party_1.format_start_time).to eq("April 26, 2002 at 01:00")
      end
    end

    context "#host_name" do
      it "returns the name of the party's host" do
        expect(@party_1.host_name).to eq(@user1.name)
        expect(@party_2.host_name).to eq(@user1.name)
      end
    end
  end
end
