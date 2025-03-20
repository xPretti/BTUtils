#ifndef KEYBOARDUTILS_INCLUDED
#define KEYBOARDUTILS_INCLUDED

class CKeyboardUtils
{
  public:
    CKeyboardUtils();
    ~CKeyboardUtils();

    // Keys
    static bool IsSpace(long id) { return (id == 32); };
    static bool IsBackSpace(long id) { return (id == 8); };
    static bool IsCtrl(long id) { return (id == 17); };
    static bool IsShift(long id) { return (id == 16); };
    static bool IsTab(long id) { return (id == 9); };
    static bool IsEsq(long id) { return (id == 27); };
    static bool IsCapsLock(long id) { return (id == 20); };
    static bool IsEnter(long id) { return (id == 13); };
};

/**
 * Contrutores e Destrutores
 */
CKeyboardUtils::CKeyboardUtils()
{
}
CKeyboardUtils::~CKeyboardUtils()
{
}

#endif /* KEYBOARDUTILS_INCLUDED */
