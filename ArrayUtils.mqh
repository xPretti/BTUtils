#ifndef B96149FF_EA88_488E_B23A_EC0CAB0F0E0F_INCLUDED
#define B96149FF_EA88_488E_B23A_EC0CAB0F0E0F_INCLUDED

class CArrayUtils
{
  public:
    // Methods
    //- GET
    static int FixIndex(int index, int max);
    template<typename T>
    static int FixIndex(int index, T& array[]);
};

/**
 * Definições
 */
int CArrayUtils::FixIndex(int index, int max)
{
  return (MathMax(0, MathMin(index, max-1)));
}

template<typename T>
int CArrayUtils::FixIndex(int index, T& array[])
{
  return (FixIndex(index, ArraySize(array)));
}

#endif /* B96149FF_EA88_488E_B23A_EC0CAB0F0E0F_INCLUDED */
