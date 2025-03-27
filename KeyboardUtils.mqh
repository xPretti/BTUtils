#ifndef KEYBOARDUTILS_INCLUDED
#define KEYBOARDUTILS_INCLUDED

class CKeyboardUtils
{
  public:
    CKeyboardUtils();
    ~CKeyboardUtils();

    // Keys
    static bool IsSpace(int id) { return (id == 32); };
    static bool IsBackSpace(int id) { return (id == 8); };
    static bool IsCtrl(int id) { return (id == 17); };
    static bool IsShift(int id) { return (id == 16); };
    static bool IsTab(int id) { return (id == 9); };
    static bool IsEsq(int id) { return (id == 27); };
    static bool IsCapsLock(int id) { return (id == 20); };
    static bool IsEnter(int id) { return (id == 13); };
    static bool IsRightArrow(int id) { return (id == 39); };
    static bool IsLeftArrow(int id) { return (id == 37); };
    static bool IsUpArrow(int id) { return (id == 38); };
    static bool IsDownArrow(int id) { return (id == 40); };

    // States
    static bool IsShiftPressed() { return (TerminalInfoInteger(TERMINAL_KEYSTATE_SHIFT) != 0); };
    static bool IsCtrlPressed() { return (TerminalInfoInteger(TERMINAL_KEYSTATE_CONTROL) != 0); };
    static bool IsAltPressed() { return (TerminalInfoInteger(TERMINAL_KEYSTATE_MENU) != 0); };
    static bool IsCapsLockPressed() { return (TerminalInfoInteger(TERMINAL_KEYSTATE_CAPSLOCK) != 0); };
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
