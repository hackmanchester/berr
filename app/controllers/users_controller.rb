class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Welcome!"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])

    @user.tags.destroy_all

    tags = params[:tags]
    if tags
      tags.split(/,/).each do |t|
        t.strip!
        n = Tag.find_by_name(t)
        unless n 
          n = Tag.new
          n.name = t
        end
        @user.tags << n
      end
    end

    @user.save!

    redirect_to root_url

  end
end
