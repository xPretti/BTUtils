#ifndef SYMBOLUTILS_INCLUDED
#define SYMBOLUTILS_INCLUDED

#include "StringUtils.mqh"

class CSymbolUtils
{
  public:
    // Methods
    static bool Exist(string symbol);
    static bool IsCustom(string symbol);

    //- GET
    static string GetSymbol(string symbol);
    static string GetSymbolByPlaceholder(string placeholder, string defaultSymbol);
};

/**
 * Retornos
 */
// Retorna se o Simbolo é custom.
bool CSymbolUtils::IsCustom(string symbol)
{
  bool isCustom = false;
  if(::SymbolExist(symbol, isCustom))
    {
      return (isCustom);
    }
  return (false);
}
// Retorna se o Simbolo existe.
bool CSymbolUtils::Exist(string symbol)
{
  bool isCustom = false;
  return (::SymbolExist(symbol, isCustom));
}
// Retorna o symbol, caso for SYMBOL ou ' ', então será Symbol()
string CSymbolUtils::GetSymbol(string symbol)
{
  string param = CStringUtils::GetNoSpace(symbol);
  if(param == "SYMBOL" || param == "")
    {
      return (Symbol());
    }
  return (Exist(symbol) ? symbol : Exist(param) ? param : "NULL");
}

/**
 * Retorna o Simbolo usando um placeholder: "SYMBOL", "REAL", "".
 * Retorna NULL casso não seja um simbolo ou placeholder válido.
 */
string CSymbolUtils::GetSymbolByPlaceholder(string placeholder, string defaultSymbol)
{
  if(CStringUtils::GetNoSpace(placeholder) == "REAL")
    {
      return (defaultSymbol);
    }
  return (GetSymbol(placeholder));
}

#endif /* SYMBOLUTILS_INCLUDED */
