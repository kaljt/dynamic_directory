require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get "/" do
  #@file_list = Dir.entries "public/"
  @sort = "Sort descending"
  @file_list = Dir.entries("public/").select {|file_name| !Dir.exist?(file_name) }.sort
  if params[:sort_order] == 'reverse'
    @file_list.reverse!
    @sort = "Sort ascending"
  end
  erb :home
end