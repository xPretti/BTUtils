#ifndef A344ACEB_19AD_4D67_8978_1113A358AE1B_INCLUDED
#define A344ACEB_19AD_4D67_8978_1113A358AE1B_INCLUDED

class CShortUtils
{
  public:
    static bool IsAlpha(ushort s);
    static bool IsDigit(ushort s);
    static bool IsDigitDecimal(ushort s);
    static bool IsSignal(ushort s);
    static bool IsAlnum(ushort s);
    static bool IsOperator(ushort s);
    static bool IsOperatorCalc(ushort s);
    static bool IsText(ushort s);
    static bool IsIdentifier(ushort s);
};

/**
 * Verifica se o caracter é uma letra do alfabeto
 */
bool CShortUtils::IsAlpha(ushort s)
{
  return ((s >= 'a' && s <= 'z') || (s >= 'A' && s <= 'Z'));
}

/**
 * Verifica se o caracter é um digito
 */
bool CShortUtils::IsDigit(ushort s)
{
  return ((s >= '0' && s <= '9'));
}

/**
 * Verifica se o caracter é um digito ou um ponto
 */
bool CShortUtils::IsDigitDecimal(ushort s)
{
  return (IsDigit(s) || s == '.');
}

/**
 * Verifica se o caracter é um sinal de mais ou menos
 */
bool CShortUtils::IsSignal(ushort s)
{
  return (s == '-' || s == '+');
}

/**
 * Verifica se o caracter é alfanumerico mas levando em consideração o ponto decimal
 */
bool CShortUtils::IsAlnum(ushort s)
{
  return (IsAlpha(s) || IsDigitDecimal(s));
}

/**
 * Verifica se o caracter é um operador
 */
bool CShortUtils::IsOperator(ushort s)
{
  return (s == '>' || s == '<' || s == '=' || s == '!' || s == '|' || s == '/' || s == '+' || s == '-' || s == '*' || s == '%' || s == '?' || s == ':' || s == '&'
          || s == '(' || s == ')' || s == ',' || s == '.');
}

/**
 * Verifica se o caracter é um operador de calculo
 */
bool CShortUtils::IsOperatorCalc(ushort s)
{
  return (s == '+' || s == '-' || s == '*' || s == '/' || s == '%');
}

/**
 * Verifica se o caracter é um texto
 */
bool CShortUtils::IsText(ushort s)
{
  return ((s >= ' ' && s <= '~') || (s > 127 && s < 255));
}

/**
 * Verifica se o caracter é um identificador, usado em placeholders, variaveis, etc
 * Não leva em consideração numeros e sinais
 */
bool CShortUtils::IsIdentifier(ushort s)
{
  return (IsAlpha(s) || s == '_' || s == '"' || s == '$' || s == '@' || s >= 127);
}

#endif /* A344ACEB_19AD_4D67_8978_1113A358AE1B_INCLUDED */
