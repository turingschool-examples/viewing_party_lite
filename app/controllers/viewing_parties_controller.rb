# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  before_action :all_users, only: [:new]

  def new
    @user = User.find(params[:user_id])
  end

  def create
    host_user = User.find(params[:id])
    party = ViewingParty.create!(
      duration: params[:duration],
      date: "#{params['date(1i)']}/#{params['date(2i)']}/#{params['date(3i)']}",
      start_time: "#{params['time(4i)']}:#{params['time(5i)']}",
      movie_title: params[:movie_title]
    )

    User.all.each do |user|
      if user.name == host_user.name
        PartyUser.create!(user_id: host_user.id, viewing_party_id: party.id, host: true)
      elsif params.keys.include?(user.name)
        PartyUser.create!(user_id: user.id, viewing_party_id: party.id)
      end
    end
    redirect_to user_path(host_user)
  end

  private

  def all_users
    @users = User.all.compact
    @users.keep_if { |user| user.id != params[:user_id] }
  end
end
