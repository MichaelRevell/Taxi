# encoding: utf-8
require 'Growl'

class Taxi
  def initialize
    @words = Array.new
    load_language_files
    100.times.each do
      display_random_word
      sleep(5)
    end
  end
  
  
  def load_language_files
    f = IO.readlines("./korean.txt")
    count = f.count

    for i in 0...count do
      @words << f[i]
    end
    return @words
  end

  def display_random_word
    title = "Korean"
    message = @words[Random.rand(@words.count)]
    
    Growl.notify { self.title =  title; self.message = message}
  end
end

Taxi.new