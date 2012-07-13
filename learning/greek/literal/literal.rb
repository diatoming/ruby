#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

class String
  
  VOWELS = {
    "a" => "\u03B1",  # alpha
    "e" => "\u03F5",  # epsilon
    "i" => "\u03B9",  # iota
    "o" => "\u03BF",  # omicron
    "u" => "\u03C5",  # upsilon
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
    "." => "~",       # full stop
    ";" => "~",       # semi colon
    ":" => "~",       # colon
    "?" => "\u03DF",  # question mark
    "!" => "\u0371",  # exclamation mark
  }
  
  def to_greek
    lst = ""
    downcase.each_char do |ch| 
      case
      when (VOWELS.include? ch)       ; (lst << VOWELS[ch])
      when (CONSONANTS.include? ch)   ; (lst << CONSONANTS[ch])
      when (PUNCTUATION.include? ch)  ; (lst << PUNCTUATION[ch])
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

vowels = "aeiou"
p vowels.to_greek
vowels.to_file file, 'a'

consonants = "bcdfghjklmnpqrstvwxyz"
p consonants.to_greek
consonants.to_file file, 'a'

punctuation = " , . ; : ? !"
p punctuation.to_greek
punctuation.to_file file, 'a'

test = "This is a test. Note: this is a test; ie, is it? Yes!"
p test.to_greek
test.to_file file, 'a'

test = "The Greek alphabet was derived from the earlier Phoenician 
alphabet, from which it differs by being the first alphabet that 
provides a full representation of one written symbol per sound both 
for vowels as well as consonants. The Greek alphabet in turn is the 
ancestor of numerous other European and Middle Eastern scripts that 
follow the same structural principle, among them Cyrillic and Latin."
p test.to_greek
test.to_file file, 'a'
