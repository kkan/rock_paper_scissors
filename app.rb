require 'sinatra'

require 'erb'
require_relative 'lib/rock_paper_scissors/game_play'

if development?
  require 'pry'
  require 'sinatra/reloader'
end

set :public_folder, -> { File.join(root, 'public') }

get '/(throw)?' do
  set_signs

  erb :index
end

post '/throw' do
  set_signs

  @play = RockPaperScissors::GamePlay.play(params[:sign].to_sym) if params[:sign]

  erb :index
end

def set_signs
  @signs = RockPaperScissors::Game.signs
end
