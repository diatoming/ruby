#!/usr/local/bin/ruby -w
# Have faith in the way things are.
#
# rcparikh.rb
# elemental composition from proximate analysis of biomass materials
# Copyright 2012 RimbaudCode
# License: GPLv3+

=begin
Jigisha Parikh, S.A. Channiwala, G.K. Ghosal. A correlation for 
calculating elemental composition from proximate analysis of biomass 
materials. Fuel 86. Elsevier. 2007.

C = 0.637FC + 0.455VM, 
H = 0.052FC + 0.062VM, 
O = 0.304FC + 0.476VM, 
where 
FC – 4.7–38.4% fixed carbon, 
VM – 57.2–90.6% volatile matter, 
C – 36.2–53.1% carbon, 
H – 4.36–8.3% hydrogen and 
O – 31.37–49.5% oxygen in wt% on a dry basis.

The average absolute error of these correlations are 
3.21%, 4.79%, 3.4% and 
bias error of 0.21%, 0.15% and 0.49% with respect to measured 
values C, H and O, respectively.
=end

=begin
Error messaging style:
Instead of 'raise StdError.new msg unless...' where 'msg' represents a 
meaninful description of the error, I prefer to replace 'msg' for an 
StdError subclass with a meaninful name. Less code, less clutter, more 
consistence ;)
=end

class NonFloatError < TypeError ; end
class FCNonFloatError < NonFloatError ; end
class VMNonFloatError < NonFloatError ; end

class FCRangeError < RangeError ; end
class VMRangeError < RangeError ; end
class CRangeError < RangeError ; end
class HRangeError < RangeError ; end
class ORangeError < RangeError ; end

class Parikh < Object
  def initialize fc, vm
    # model limits
    fc_lim, vm_lim = 0.047..0.384, 0.572..0.906
    raise FCNonFloatError unless fc.is_a? Float
    raise VMNonFloatError unless vm.is_a? Float
    raise FCRangeError unless fc_lim.include? fc  
    raise VMRangeError unless vm_lim.include? vm
    @fc, @vm = fc, vm
  end
  def carbon
    c_lim = 0.362..0.531
    c = 0.637 * @fc + 0.455 * @vm
    raise CRangeError unless c_lim.include? c
    c
  end
  def hydrogen
    h_lim = 0.0436..0.083
    h = 0.052 * @fc + 0.062 * @vm
    raise HRangeError unless h_lim.include? h
    h
  end
  def oxygen
    o_lim = 0.3137..0.495
    o = 0.304 * @fc + 0.476 * @vm
    raise ORangeError unless o_lim.include? o
    o
  end
  def data
    fc, vm = @fc, @vm
    "<#{self.class}> fc: %1.3f vm: %1.3f" % [fc, vm]
  end
  def results
    c, h, o = self.carbon, self.hydrogen, self.oxygen
    # a bit more precision for H
    "C: %1.3f H: %1.4f O: %1.3f" % [c, h, o]
  end
  def to_s
    "#{self.data} #{self.results}"
  end
  def uncertainties
    abs_err = {'C' => 0.0321, 'H' => 0.0479, 'O' => 0.034}
    c_err = [self.carbon - abs_err['C'], self.carbon + abs_err['C']]
    h_err = [self.hydrogen - abs_err['H'], self.hydrogen + abs_err['H']]
    o_err = [self.oxygen - abs_err['O'], self.oxygen + abs_err['O']]
    {'C:' => c_err, 'H:' => h_err, 'O:' => o_err}
  end
end

