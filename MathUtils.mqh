#ifndef MATHUTILS_INCLUDED
#define MATHUTILS_INCLUDED

#include "Enums/MathEnum.mqh"

class CMathUtils
{
  public:
    // Methods
    static double ToPositive(double value) { return (MathAbs(value)); };
    static int ToPositive(int value) { return ((int)MathAbs(value)); };
    static double ToNegative(double value) { return (ToPositive(value) * -1); };
    static int ToNegative(int value) { return (ToPositive(value) * -1); };
    static uint ToCountStep(double value, double step);
    static uint ToCountGradualStep(double value, double step, double stepMultiplier = 1);
    static double ToDivide(double value, double divide);
    static double ToRestDivide(double value, double divide);

    //- GET
    static double GetPercent(double value, double target);
    static double GetPercentOfValue(double value, double percent);
    static int GetDecimals(double value);

    //- cálculos
    static double GetMedian(double v1, double v2) { return ((v1 + v2) / 2); };
    static double GetHitPercent(double gain, double loss);
    static double GetIncrement(double value, double valueToIncrement, ENUM_MATH_INCREMENT_METHOD_TYPE incrementType);
    static double GetIncrementByPercentage(double value, double valueToIncrement, ENUM_MATH_INCREMENT_METHOD_TYPE incrementType);
    static int GetRandomInt(int min, int max);
    static double GetRandom();
    static double GetRound(double value);
    static double GetRoundUp(double value);
    static double GetRoundDown(double value);
    template<typename T>
    static T GetClamp(T min, T value, T max);

    // chances
    static bool IsChance(double chance);
    static bool IsChance(double min, double max, double chance);
    static double GetChance(double min, double max);

    //- comparadores
    static bool IsNearlyEqual(double a, double b) { return (MathAbs(a - b) < 1.0e-8); };
    static bool IsEqual(double a, double b) { return (a == b || IsNearlyEqual(a, b)); };
    static bool IsDifferent(double a, double b) { return (a != b && !IsNearlyEqual(a, b)); };
    static bool IsGreater(double a, double b) { return (a > b && !IsNearlyEqual(a, b)); };
    static bool IsSmaller(double a, double b) { return (a < b && !IsNearlyEqual(a, b)); };
    static bool IsGreaterOrEqual(double a, double b) { return (a >= b || IsNearlyEqual(a, b)); };
    static bool IsSmallerOrEqual(double a, double b) { return (a <= b || IsNearlyEqual(a, b)); };

    //- size
    static int Length(int& type) { return (10); };
    static int Length(uint& type) { return (10); };
    static int Length(long& type) { return (20); };
    static int Length(ulong& type) { return (20); };
    static int Length(double& type) { return (14); };
    static int Length(float& type) { return (6); };
    static int Length(string& type) { return (-1); };
};

/**
 * Conversores
 */
uint CMathUtils::ToCountStep(double value, double step)
{
  uint roundValue = (uint)MathFloor(value / step);
  return (roundValue);
}
uint CMathUtils::ToCountGradualStep(double value, double step, double stepMultiplier = 1)
{
  double newValue = value;
  double newStep = step;
  uint count = 0;
  while(ToCountStep(newValue, newStep) > 0)
    {
      count++;
      newValue -= newStep;
      newStep += step = (step * stepMultiplier);
    }
  return (count);
}

/**
 * Retorna a quantidade de porcentagem do valor
 */
double CMathUtils::GetPercentOfValue(double value, double percent)
{
  double correntPercent = percent / 100;
  value *= correntPercent;
  return (NormalizeDouble(value, 2));
}
double CMathUtils::GetHitPercent(double gain, double loss)
{
  double total = gain + loss;
  if(total > 0)
    {
      return (NormalizeDouble(((gain * 100) / total), 2));
    }
  return (0);
}
double CMathUtils::GetPercent(double value, double target)
{
  if(value == 0)
    {
      return (0);
    }
  double percent = (((target - value) / value) * 100.0);
  return (NormalizeDouble(percent, 2));
}

/**
 * Retorna o valor incrementado pelo tipo
 */
double CMathUtils::GetIncrement(double value, double valueToIncrement, ENUM_MATH_INCREMENT_METHOD_TYPE incrementType)
{
  switch(incrementType)
    {
    case MATH_INCREMENT_METHOD_TYPE_MULTIPLY: return (value * valueToIncrement);
    case MATH_INCREMENT_METHOD_TYPE_REMOVE: return (value - valueToIncrement);
    case MATH_INCREMENT_METHOD_TYPE_DIVIDE: return (ToDivide(value, valueToIncrement));
    case MATH_INCREMENT_METHOD_TYPE_DEFINE: return (valueToIncrement);
    default: return (value + valueToIncrement);
    }
}
double CMathUtils::GetIncrementByPercentage(double value, double valueToIncrement, ENUM_MATH_INCREMENT_METHOD_TYPE incrementType)
{
  switch(incrementType)
    {
    case MATH_INCREMENT_METHOD_TYPE_MULTIPLY: return (value * GetPercentOfValue(value, valueToIncrement));
    case MATH_INCREMENT_METHOD_TYPE_REMOVE: return (value - GetPercentOfValue(value, valueToIncrement));
    case MATH_INCREMENT_METHOD_TYPE_DIVIDE: return (ToDivide(value, GetPercentOfValue(value, valueToIncrement)));
    case MATH_INCREMENT_METHOD_TYPE_DEFINE: return (GetPercentOfValue(value, valueToIncrement));
    default: return (value + GetPercentOfValue(value, valueToIncrement));
    }
}

/**
 * Gera um número aleatório
 */
int CMathUtils::GetRandomInt(int min, int max)
{
  max = MathMax(min, max);
  double f = (MathRand() / 32768.0);
  return min + (int)(f * (max - min));
}
double CMathUtils::GetRandom()
{
  return ((MathRand() / 32768.0));
}

/**
 * Métodos de arredondamento
 */
double CMathUtils::GetRound(double value)
{
  return (MathRound(value));
}
double CMathUtils::GetRoundUp(double value)
{
  return (MathCeil(value));
}
double CMathUtils::GetRoundDown(double value)
{
  return (MathFloor(value));
}

/**
 * Métodos de limitação
 */
template<typename T>
T CMathUtils::GetClamp(T min, T value, T max)
{
  return (MathMin(MathMax(min, value), max));
}

/**
 * Retorna o tamanho dos dígitos de um valor double
 */
int CMathUtils::GetDecimals(double value)
{
  double compareValue = value - GetRoundDown(value);
  if(IsDifferent(compareValue, 0))
    {
      string format = StringFormat("%%.%dG", 14);
      value = StringToDouble(StringFormat(format, value));
      string strNumber = string(value);
      int dotPos = StringFind(strNumber, ".");
      if(dotPos != -1)
        {
          return (StringLen(strNumber) - dotPos - 1);
        }
    }
  return (0);
}

// Métodos seguros
double CMathUtils::ToDivide(double value, double divide)
{
  if(divide != 0)
    {
      return (value / divide);
    }
  return (0);
}
double CMathUtils::ToRestDivide(double value, double divide)
{
  if(divide != 0)
    {
      return (MathMod(value, divide));
    }
  return (0);
}

/**
 * Métodos de conversão de chances
 */
bool CMathUtils::IsChance(double chance)
{
  return (IsChance(0.01, 100, chance));
}
bool CMathUtils::IsChance(double min, double max, double chance)
{
  double newChance = GetChance(min, max);
  return (chance >= newChance);
}
double CMathUtils::GetChance(double min, double max)
{
  double chance = min + (GetRandom() * (max - min));
  return (chance);
}

#endif /* MATHUTILS_INCLUDED */
