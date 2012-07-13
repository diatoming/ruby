#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

class RCGreekParser
  
  #"i" => "\u03B9\u0308",    # dieresis
  
  # aeou: iota plus diacritics (iota: "\u03B9")
  # i: no diacritics is used, rather yot!
  VOWELS = {
    "a" => "\u03B9\u0342",    # circumflex
    "e" => "\u03B9\u0301",    # acute
    "o" => "\u03B9\u0300",    # grave
    "u" => "\u03B9\u0306",    # breve
    "i" => "\u03F3",
  }
  
  CONSONANTS = {
    "b" => "\u03B2",  # beta
    "c" => "\u03B6",  # zeta
    "d" => "\u03B4",  # delta
    "f" => "\u03C6",  # phi
    "g" => "\u03B3",  # gamma
    "h" => "\u03B7",  # eta
    "j" => "\u03C7",  # chi
    "k" => "\u03BA",  # kappa
    "l" => "\u03BB",  # lambda
    "m" => "\u03BC",  # mu
    "n" => "\u03BD",  # nu
    "p" => "\u03C0",  # pi
    "q" => "\u03BA",  # kappa
    "r" => "\u03C1",  # rho
    "s" => "\u03B6",  # zeta
    "t" => "\u03C4",  # tau
    "v" => "\u03B2",  # beta
    "w" => "\u03C9",  # omega
    "x" => "\u03BE",  # xi
    "y" => "\u03F0",  # ?
    "z" => "\u03B6",  # zeta
  }
  
  PUNCTUATION = {
    " " => " ",       # space
    "," => ",",       # comma
    "." => ".",       # full stop
    ";" => ".",       # semi colon
    ":" => "~",       # colon
    "?" => ";",       # question mark
    "!" => "\u0371",  # exclamation mark
  }
  
  def initialize text
    @text = text
  end
  
  def to_greek
    lst = ""
    @text.downcase.each_char do |ch| 
      case
      when (VOWELS.include? ch)      ; (lst << VOWELS[ch])
      when (CONSONANTS.include? ch)  ; (lst << CONSONANTS[ch])
      when (PUNCTUATION.include? ch) ; (lst << PUNCTUATION[ch])
      else ;
      end
    end
    lst
  end
  
  def to_file fname, mode
    File.open fname, mode do |f| 
      f.puts self.to_greek
    end
  end
    
end


file = "test.txt"
text = "The Greek alphabet was derived from the earlier Phoenician 
alphabet, from which it differs by being the first alphabet that 
provides a full representation of one written symbol per sound both 
for vowels as well as consonants. The Greek alphabet in turn is the 
ancestor of numerous other European and Middle Eastern scripts that 
follow the same structural principle, among them Cyrillic and Latin."

parser = RCGreekParser.new text
p parser.to_greek
parser.to_file file, 'w'
