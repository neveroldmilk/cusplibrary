#include <cusp/array1d.h>
#include <cusp/blas.h>
#include <cusp/copy.h>
#include <cusp/print.h>

int main(void)
{
  // define array container type
  typedef cusp::array1d<int, cusp::device_memory> Array;
  
  // define array view type
  typedef Array::view View;

  // allocate array1d container with 10 elements
  Array array(10,0);

  // create view to the first 5 elements of the array
  View first_half(array.begin(), array.begin() + 5);

  // create view to the last 5 elements of the array
  View last_half(array.begin() + 5, array.end());

  // fill the first half of the array with 1s
  cusp::blas::fill(first_half, 1);
  
  // fill the first half of the array with 2s
  cusp::blas::fill(last_half,  2);

  // print the array
  cusp::print_matrix(array);

  // copy the first half to the last half
  cusp::copy(first_half, last_half);
  
  // print the array
  cusp::print_matrix(array);

  return 0;
}
