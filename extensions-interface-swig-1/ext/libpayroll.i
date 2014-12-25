/* ext/libpayroll.i */
%module libpayroll
%{
  #include "libpayroll.h"
%}

extern double calculate_sui_tax(const double amount, const double rate);
