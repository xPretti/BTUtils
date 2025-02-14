#ifndef POINTERUTILS_INCLUDED
#define POINTERUTILS_INCLUDED

class CPointerUtils
{
  public:
    CPointerUtils();
    ~CPointerUtils();

    // Verify
    template<typename T>
    static bool IsValid(T* checkClass);
    template<typename T1, typename T2>
    static bool IsEqual(T1* v1, T2* v2);
    template<typename T>
    static bool Delete(T*& checkClass);
    template<typename T>
    static bool IsDynamic(T* checkClass);
};

/**
 * Construtores e Destrutores
 */
CPointerUtils::CPointerUtils()
{
}
CPointerUtils::~CPointerUtils()
{
}

/**
 * Verificações
 */
template<typename T>
bool CPointerUtils::IsValid(T* checkClass)
{
  return (CheckPointer(checkClass) != POINTER_INVALID);
}

template<typename T1, typename T2>
bool CPointerUtils::IsEqual(T1* v1, T2* v2)
{
  if(IsValid(v1) && IsValid(v2))
    {
      return (v1 == v2);
    }
  return (false);
}

template<typename T>
bool CPointerUtils::Delete(T*& checkClass)
{
  if(IsValid(checkClass) && IsDynamic(checkClass))
    {
      delete(checkClass);
      return (true);
    }
  return (false);
}

template<typename T>
bool CPointerUtils::IsDynamic(T* checkClass)
{
  if(IsValid(checkClass))
    {
      return (CheckPointer(checkClass) == POINTER_DYNAMIC);
    }
  return (false);
}

#endif /* POINTERUTILS_INCLUDED */
