#ifndef CONVERTERSUTILS_INCLUDED
#define CONVERTERSUTILS_INCLUDED

#include "MathUtils.mqh"

class CConvertersUtils
{
  public:
    CConvertersUtils();
    ~CConvertersUtils();

    // Methods
    static string ToFinancialText(string symbol, double value, uint digits = 2);

    //- to string
    static string ToString(string v) { return (v); };
    static string ToString(uint v) { return ((string)v); };
    static string ToString(double v);
    static string ToString(datetime v, bool inNumber = true);
    static string ToString(datetime v, int flags) { return (TimeToString(v, flags)); }; // FLAGS: TIME_DATE | TIME_MINUTES | TIME_SECONDS
    static string ToString(int v) { return ((string)v); };
    static string ToString(long v) { return ((string)v); };
    static string ToString(ulong v) { return ((string)v); };
    static string ToString(bool v) { return (v ? "true" : "false"); };

    //- to int
    static int ToInt(int v) { return (v); };
    static int ToInt(uint v) { return ((int)v); };
    static int ToInt(string v) { return ((int)StringToInteger(v)); };
    static int ToInt(datetime v) { return ((int)v); };
    static int ToInt(double v) { return ((int)v); };
    static int ToInt(long v) { return ((int)v); };
    static int ToInt(ulong v) { return ((int)v); };
    static int ToInt(bool v) { return ((int)v); }; 
    //- to uint
    static uint ToUint(int v) { return ((int)v); };
    static uint ToUint(uint v) { return (v); };
    static uint ToUint(string v) { return ((uint)StringToInteger(v)); };
    static uint ToUint(datetime v) { return ((uint)v); };
    static uint ToUint(double v) { return ((uint)v); };
    static uint ToUint(long v) { return ((uint)v); };
    static uint ToUint(ulong v) { return ((uint)v); };
    static uint ToUint(bool v) { return ((uint)v); };

    //- to double
    static double ToDouble(double v) { return (v); };
    static double ToDouble(uint v) { return ((double)v); };
    static double ToDouble(string v) { return (StringToDouble(v)); };
    static double ToDouble(datetime v) { return ((double)v); };
    static double ToDouble(int v) { return ((double)v); };
    static double ToDouble(long v) { return ((double)v); };
    static double ToDouble(ulong v) { return ((double)v); };
    static double ToDouble(bool v) { return ((double)v); };

    //- to datetime
    static datetime ToDatetime(datetime v) { return (v); };
    static datetime ToDatetime(uint v) { return ((datetime)v); };
    static datetime ToDatetime(string v) { return ((datetime)StringToInteger(v)); };
    static datetime ToDatetime(double v) { return ((datetime)v); };
    static datetime ToDatetime(int v) { return ((datetime)v); };
    static datetime ToDatetime(long v) { return ((datetime)v); };
    static datetime ToDatetime(ulong v) { return ((datetime)v); };

    //- enum
    template<typename T>
    static T ToEnum(string v);
};

/**
 * Construtores e Destrutores
 */
CConvertersUtils::CConvertersUtils()
{
}
CConvertersUtils::~CConvertersUtils()
{
}

/**
 * Convesores
 */
string CConvertersUtils::ToString(double v)
{
  return (DoubleToString(v, CMathUtils::GetDecimals(v)));
}
string CConvertersUtils::ToFinancialText(string symbol, double value, uint digits = 2)
{
  string moneySimbol = SymbolInfoString(symbol, SYMBOL_CURRENCY_BASE);
  string moneyText   = DoubleToString(value, digits) + " " + moneySimbol;
  return (moneyText);
}
string CConvertersUtils::ToString(datetime v, bool inNumber = true)
{
  if(inNumber)
    {
      long value = (long)v;
      return (ToString(value));
    }
  return (TimeToString(v, TIME_DATE | TIME_MINUTES | TIME_SECONDS));
}

/**
 * Converte um texto para enum
 */
template<typename T>
T CConvertersUtils::ToEnum(string v)
{
  T type = (T)ToInt(v);
  return (type);
}

#endif /* CONVERTERSUTILS_INCLUDED */
