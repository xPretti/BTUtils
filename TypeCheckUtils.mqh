#ifndef TYPECHECKUTILS_INCLUDED
#define TYPECHECKUTILS_INCLUDED

#include "ShortUtils.mqh"
#include "SymbolUtils.mqh"
#include "TimeFrameUtils.mqh"

class CTypeCheckUtils
{
  public:
    CTypeCheckUtils();
    ~CTypeCheckUtils();

    // Methods
    static bool IsTimeFrame(string s);
    static bool IsSymbol(string s);
    static bool IsTimeFrame(string s, ENUM_TIMEFRAMES& value, ENUM_TIMEFRAMES defaultTimeFrame);
    static bool IsSymbol(string s, string& value, string defaultSymbol);
    static bool IsNumber(string s, double& value);
    static bool IsNumber(string s, int& value);
    static bool IsDouble(string s, double& value);
    static bool IsInteger(string s, int& value);
    static bool IsBoolean(string s);
    static bool IsBoolean(string s, bool& value);
    static bool IsColor(string s, color& value);
    static bool IsPriceMethods(string s, int& value);
    static bool IsMethods(string s, int& value);
    static bool IsVolume(string s, int& value);
    static bool IsStochastic(string s, int& value);

    // Somente bool
    static bool IsString(string s);
    static bool IsDouble(string s);
    static bool IsInteger(string s);
};

/**
 * Construtores e Destrutores
 */
CTypeCheckUtils::CTypeCheckUtils()
{
}
CTypeCheckUtils::~CTypeCheckUtils()
{
}

// Verificar se o valor um timeframe
bool CTypeCheckUtils::IsTimeFrame(string s)
{
  ENUM_TIMEFRAMES ignore;
  return (IsTimeFrame(s, ignore, ignore));
}
bool CTypeCheckUtils::IsTimeFrame(string s, ENUM_TIMEFRAMES& value, ENUM_TIMEFRAMES defaultTimeFrame)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  bool isTimeFrame = false;
  ENUM_TIMEFRAMES value1 = CTimeFrameUtils::GetTimeFrameByPlaceholder(s, defaultTimeFrame);
  if(value1 >= 0)
    {
      isTimeFrame = true;
      value = value1;
    }
  return (isTimeFrame);
}

// Verificar se o valor um symbol
bool CTypeCheckUtils::IsSymbol(string s)
{
  string ignore;
  return (IsSymbol(s, ignore, ignore));
}
bool CTypeCheckUtils::IsSymbol(string s, string& value, string defaultSymbol)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  bool isSymbol = false;
  string value1 = CSymbolUtils::GetSymbolByPlaceholder(s, defaultSymbol);
  if(value1 != "NULL")
    {
      isSymbol = true;
      value = value1;
    }
  return (isSymbol);
}

// Retorna se é uma string
bool CTypeCheckUtils::IsString(string s)
{
  if(s.Length() > 0)
    {
      uint i = 0;
      while(i < s.Length())
        {
          if(CShortUtils::IsText(s.GetChar(i)))
            {
              return (true);
            }
          i++;
        }
    }
  return (false);
}
// Retorna se é um numero e converte para double
bool CTypeCheckUtils::IsNumber(string s, double& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  value = 0;
  string save = "";
  if(s.Length() > 0)
    {
      uint i = 0;
      while(i < s.Length())
        {
          if(CShortUtils::IsDigitDecimal(s.GetChar(i)) || CShortUtils::IsSignal(s.GetChar(i)))
            {
              save += ShortToString(s.GetChar(i));
            }
          else
            {
              return (false);
            }
          i++;
        }
      value = StringToDouble(save);
      return (true);
    }
  return (false);
}

// Retorna se é um numero e converte para int
bool CTypeCheckUtils::IsNumber(string s, int& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  value = 0;
  string save = "";
  if(s.Length() > 0)
    {
      uint i = 0;
      while(i < s.Length())
        {
          if(CShortUtils::IsDigit(s.GetChar(i)) || CShortUtils::IsSignal(s.GetChar(i)))
            {
              save += ShortToString(s.GetChar(i));
            }
          else
            {
              return (false);
            }
          i++;
        }
      value = (int)StringToInteger(save);
      return (true);
    }
  return (false);
}

// Retorna o inteiro correspondente ao método
bool CTypeCheckUtils::IsPriceMethods(string s, int& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  if(s == "CLOSE")
    {
      value = 1;
      return (true);
    }
  else if(s == "OPEN")
    {
      value = 2;
      return (true);
    }
  else if(s == "HIGH")
    {
      value = 3;
      return (true);
    }
  else if(s == "LOW")
    {
      value = 4;
      return (true);
    }
  else if(s == "MEDIAN")
    {
      value = 5;
      return (true);
    }
  else if(s == "TYPICAL")
    {
      value = 6;
      return (true);
    }
  else if(s == "WEIGHTED")
    {
      value = 7;
      return (true);
    }
  return (false);
}

// Retorna o inteiro correspondente ao método
bool CTypeCheckUtils::IsMethods(string s, int& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  if(s == "SIMPLE")
    {
      value = 0;
      return (true);
    }
  else if(s == "EXPONENTIAL")
    {
      value = 1;
      return (true);
    }
  else if(s == "SMOOTHED")
    {
      value = 2;
      return (true);
    }
  else if(s == "LINEAR")
    {
      value = 3;
      return (true);
    }
  return (false);
}

// Retorna o inteiro correspondente ao método
bool CTypeCheckUtils::IsVolume(string s, int& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  if(s == "TICK")
    {
      value = 0;
      return (true);
    }
  else if(s == "REAL")
    {
      value = 1;
      return (true);
    }
  return (false);
}

// Retorna o inteiro correspondente ao método
bool CTypeCheckUtils::IsStochastic(string s, int& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  if(s == "LOWHIGH")
    {
      value = 0;
      return (true);
    }
  else if(s == "CLOSECLOSE")
    {
      value = 1;
      return (true);
    }
  return (false);
}

// Verificar se o valor é boolean
bool CTypeCheckUtils::IsBoolean(string s)
{
  bool ignore = false;
  return (IsBoolean(s, ignore));
}
bool CTypeCheckUtils::IsBoolean(string s, bool& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  value = s == "TRUE";
  return (s == "TRUE" || s == "FALSE");
}

// Verificar se o valor é double
bool CTypeCheckUtils::IsDouble(string s, double& value)
{
  return (IsNumber(s, value));
}
bool CTypeCheckUtils::IsDouble(string s)
{
  double value;
  return (IsNumber(s, value));
}

// Verificar se o valor é integer
bool CTypeCheckUtils::IsInteger(string s, int& value)
{
  return (IsNumber(s, value));
}
bool CTypeCheckUtils::IsInteger(string s)
{
  int value = 0;
  return (IsNumber(s, value));
}

// Verificar se o valor uma cor
bool CTypeCheckUtils::IsColor(string s, color& value)
{
  StringToUpper(s);
  StringReplace(s, " ", "");
  bool isColor = false;
  color value1 = StringToColor(s);
  string value2 = string(value1);
  StringToUpper(value2);
  if(value2 == s)
    {
      isColor = true;
      value = value1;
    }
  return (isColor);
}

#endif /* TYPECHECKUTILS_INCLUDED */
