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
    template<typename S, typename D>
    static bool CopyStruct(S& source[], D& destiny[]);
};

/**
 * Definições
 */
int CArrayUtils::FixIndex(int index, int max)
{
  return (MathMax(0, MathMin(index, max - 1)));
}

template<typename T>
int CArrayUtils::FixIndex(int index, T& array[])
{
  return (FixIndex(index, ArraySize(array)));
}

template<typename S, typename D>
bool CArrayUtils::CopyStruct(S& source[], D& destiny[])
{
  uint size = (uint)source.Size();
  if(size > 0)
    {
      ArrayRemove(destiny, 0);
      ArrayFree(destiny);
      ArrayResize(destiny, size);
      for(uint i = 0; i < size; i++)
        {
          destiny[i] = source[i];
        }
      return (true);
    }
  return (false);
}


#endif /* B96149FF_EA88_488E_B23A_EC0CAB0F0E0F_INCLUDED */
