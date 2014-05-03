require 'sinatra'

get '/' do
  File.read(File.join('public', 'index.html'))
end

put '/locale/pages/:id' do
  puts params
end
