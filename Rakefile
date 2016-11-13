require 'erb'

def build(file_name)
  json = ERB.new(File.read('Solarized.json.erb')).result
  File.write(file_name, json)
end

def build_light
  @theme_name = 'solarized_light'
  @optional_emphasized_content = '#586e75'
  @body_text__default_code__primary_content = '#657b83'
  @comments__secondary_contents = '#93a1a1'
  @background_highlights = '#eee8d5'
  @background_highlights_rgba = '238,232,213,.1'
  @background = '#fdf6e3'
  @blue = '#268bd2'
  build('Solarized Light.json')
end

def build_dark
  @theme_name = 'solarized_dark'
  @optional_emphasized_content = '#93a1a1'
  @body_text__default_code__primary_content = '#839496'
  @comments__secondary_contents = '#586e75'
  @background_highlights = '#073642'
  @background_highlights_rgba = '7,54,66,.1'
  @background = '#002b36'
  @blue = '#268bd2'
  build('Solarized Dark.json')
end

task :build do
  build_light
  build_dark
end
