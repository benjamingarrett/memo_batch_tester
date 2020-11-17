from math import ceil


class nru:

  @staticmethod
  def get_optimal_a(d, n):
    return (1/int(n))*(ceil(int(n)/int(d))-1)
