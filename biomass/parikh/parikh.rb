#!/usr/local/bin/ruby -w
# Have faith in the way things are.
#
# parikh.rb
# elemental composition from proximate analysis of biomass
# Copyright 2012 RimbaudCode
# License: GPLv3+

=begin
Reference:
  Jigisha Parikh, S.A. Channiwala, G.K. Ghosal. A correlation for 
  calculating elemental composition from proximate analysis of biomass 
  materials. Fuel 86. Elsevier, 2007

Model:
  C = 0.637FC + 0.455VM
  H = 0.052FC + 0.062VM
  O = 0.304FC + 0.476VM

Nomenclature and limits:
  FC – 4.7–38.4% fixed carbon, 
  VM – 57.2–90.6% volatile matter, 
  C – 36.2–53.1% carbon, 
  H – 4.36–8.3% hydrogen and 
  O – 31.37–49.5% oxygen in wt% on a dry basis.
=end

class Parikh

  attr_accessor :fc, :vm

  def validate model
    # model should be a hash with the following structure
    # {'fc' => [fc, 0.047, 0.384]}
    raise TypeError unless model.is_a? Hash
    model.each_key do |key|
      raise TypeError unless key.is_a? String
      model[key].each do |item|
        raise TypeError unless item.is_a? Float
      end
      raise RangeError unless model[key][1] < model[key][2]
      valid_range = model[key][1]..model[key][2]
      raise RangeError unless valid_range.include? model[key][0]
    end
  end

  def initialize fc, vm
    model = {'fc' => [fc, 0.047, 0.384], 'vm' => [vm, 0.572, 0.906]}
    self.validate model
    @fc, @vm = fc, vm
  end

  def carbon
    valid_range = (0.362..0.531)
    c = 0.637 * @fc + 0.455 * @vm 
    raise RangeError unless valid_range.include? c
    return c
  end

  def hydrogen
    valid_range = (0.0436..0.083)
    h = 0.052 * fc + 0.062 * @vm
    raise RangeError unless valid_range.include? h
    return h
  end

  def oxygen
    valid_range = (0.3137..0.495)
    o = 0.304 * @fc + 0.476 * @vm
    raise RangeError unless valid_range.include? o
    return o
  end

  def elements
    e = {'C' => self.carbon, 'H' => self.hydrogen, 'O' => self.oxygen}
    raise RangeError unless (e.values.inject :+) <= 1.00
    return e
  end

end
