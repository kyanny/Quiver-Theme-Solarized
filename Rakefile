require 'erb'

def build(file_name)
  json = ERB.new(File.read('Solarized.json.erb')).result
  File.write(file_name, json)
end

def build_light
  @theme_name = 'solarized_light'
  @base03 = nil
  @base02 = nil
  @base01 = '#586e75'
  @base00 = '#657b83'
  @base0 = nil
  @base1 = '#93a1a1'
  @base2 = '#eee8d5'
  @base2_rgba = '238,232,213,.1'
  @base3 = '#fdf6e3'
  @yellow = nil
  @orange = nil
  @red = nil
  @magenta = nil
  @violet = nil
  @blue = '#268bd2'
  @cyan = nil
  @green = nil
  build('Solarized Light.json')
end

task :build do
  build_light
end
