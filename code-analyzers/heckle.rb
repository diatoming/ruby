# run as
# $ heckle heckle.rb
# error with ruby >= 2.1.5

if month > 12 then
  if month % 12 == 0 then
    year += (month - 12) / 12
    month = 12
  else
    year += month / 12
    month = month % 12
  end
end