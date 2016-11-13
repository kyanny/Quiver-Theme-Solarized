#!/usr/bin/env ruby
require 'json'

table = {}
%Q|
$base03:    #002b36;
$base02:    #073642;
$base01:    #586e75;
$base00:    #657b83;
$base0:     #839496;
$base1:     #93a1a1;
$base2:     #eee8d5;
$base3:     #fdf6e3;
$yellow:    #b58900;
$orange:    #cb4b16;
$red:       #dc322f;
$magenta:   #d33682;
$violet:    #6c71c4;
$blue:      #268bd2;
$cyan:      #2aa198;
$green:     #859900;
|.split("\n").map { |line|
  next if line.empty?
  key, val = line.split(/\s+/)
  key = key.match(/\A\$(.+):/)[1]
  val = val.match(/(.+);\z/)[1]
  table[key] = val
}

def get_value(data)
  values = []
  data.each do |key, val|
    case val
    when String, Integer
      values << val
    else
      values << get_value(val)
    end
  end
  values.flatten.uniq.select { |val| val.is_a?(String) && !val.empty? && val.match(/\A#/) }
end

def check(table, json)
  exitcode = 0
  css = json.delete('css')
  values = get_value(json)
  values.each do |val|
    unless table.values.include?(val)
      puts val
      exitcode = 1
    end
  end
  _values = []
  css.each do |key, val|
    _values << val.scan(/\#[a-fA-F0-9]{6}/).uniq
  end
  _values.flatten!.uniq!
  _values.each do |_val|
    unless table.values.include?(_val)
      puts _val
      exitcode = 2
    end
  end
  exitcode
end

exitcode = 0

puts "Solarized Light"
light = JSON.parse(File.read('Solarized Light.json'))
exitcode = check(table, light)

puts "Solarized Dark"
dark = JSON.parse(File.read('Solarized Dark.json'))
exitcode = check(table, dark)

exit(exitcode)
