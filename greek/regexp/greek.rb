#!/usr/local/bin/ruby -wKU
# Have faith in the way things are.

# transcripcion del ingles al "griego" ;)

# referencias:
# J. «Mach» Wust, Ignacio Fdez. Galván. Modo de escritura «tengwar» 
# para el castellano. 21 de abril de 2007

# Write Your Name in Elvish in Ten Minutes

# decisiones de disenio:
# vocales con letras propias o diacriticas? --> diacriticas!
# ortografia tradicional o pronunciacion? --> tradicional
# representacion en "griego", solamente en letras minusculas

class RCGreekParser < Object
  
  CONSONANTS = {
    # beta sound: b, v
    "b" => "\u03B2", "v" => "\u03B2",
    # zeta sound: c, s, z
    "c" => "\u03B6",  # zeta
    "s" => "\u03B6",  # zeta
    "z" => "\u03B6",  # zeta
    # others
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
    "t" => "\u03C4",  # tau
    "w" => "\u03C9",  # omega
    "x" => "\u03BE",  # xi
    "y" => "\u03F0",  # ?
  }
  
  DOUBLES = {
    "ee" => "\u0390", # GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS
    "oo" => "\u03AD", # GREEK SMALL LETTER EPSILON WITH TONOS
    "ff" => "\u03F4\u0308", # theta plus dieresis
    "ll" => "\u03BB\u0308", # lambda plus dieresis
  }
  
  PHONETICS = {
    "ph" => "\u03C6", # same as f
    "th" => "\u03F4",
    # sh
    # ch
    # sc: will appear as ss or cc, cause we are using the same symbol!
  }
    
  #"i" => "\u03B9\u0308",     # dieresis  
  # aeou: iota plus diacritics (iota: "\u03B9")
  # i: no diacritics is used, rather yot!
  VOWELS = {
    "a" => "\u03B9\u0342",    # circumflex
    "e" => "\u03B9\u0301",    # acute
    "o" => "\u03B9\u0300",    # grave
    "u" => "\u03B9\u0306",    # breve
    "i" => "\u03F3",
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
    
  def initialize english_text
    @english = english_text.downcase
    @greek   = ""
  end
  
  def to_greek
    @greek = @english
    @greek = @greek.gsub(/ee|oo|ff|ll/, DOUBLES)
    @greek = @greek.gsub(/ph|th/, PHONETICS)
    @greek = @greek.gsub(/[aeiou]/, VOWELS)
    @greek = @greek.gsub(/[bcdfghjklmnpqrstvwxyz]/, CONSONANTS)
    @greek = @greek.gsub(/[ \,\.\;\?\!]/, PUNCTUATION)
  end
  
  def to_file fname, mode
    File.open fname, mode do |f| 
      f.puts to_greek
    end
  end
    
end

file = "test.txt"
english = "The Greek alphabet was derived from the earlier Phoenician 
alphabet, from which it differs by being the first alphabet that 
provides a full representation of one written symbol per sound both 
for vowels as well as consonants. The Greek alphabet in turn is the 
ancestor of numerous other European and Middle Eastern scripts that 
follow the same structural principle, among them Cyrillic and Latin."

parser = RCGreekParser.new english
p parser
puts
puts parser.to_greek
parser.to_file file, 'w'
