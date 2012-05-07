class FriendsController < ApplicationController

  def map
    friends = Friend.all
    result = {}
    friends.each do |friend|
      if friend.latitude
        if result[friend.location]
          result[friend.location]['population'] += 1
        else
          result[friend.location] = { 'lat'=>friend.latitude.to_f, 'lng'=>friend.longitude.to_f, 'population'=>1 }
        end
      end
    end
    return result
  end

  def reduce(data)
    result = {}
    add = false
    data.each do |key,value|
      add = false
      result.each do |key_r, value_r|
        if ((value_r['lat'] - value['lat'] < 0.07) and (value_r['lat'] - value['lat'] > -0.07) )  and ( (value_r['lng'] - value['lng'] < 0.07) and (value_r['lng'] - value['lng'] > -0.07) )
          value_r['population'] += value['population']
          add = true
          break
        end
      end
      if !add
        result[key] = value
      end
    end
    return result
  end

  # GET /friends
  # GET /friends.json
  def index
    @map_reduce = reduce(map)
    @friends = Friend.page(params[:page]).per(9).order('lastname')
    @friends_map = Friend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friend }
    end
  end

end
