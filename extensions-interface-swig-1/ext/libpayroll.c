/* ext/libpayroll.c */
#include "libpayroll.h"

double calculate_sui_tax(const double amount, const double rate)  
{
  double tax = amount * rate;
  return tax;
}
