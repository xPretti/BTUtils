#ifndef TIMEFRAMEUTILS_INCLUDED
#define TIMEFRAMEUTILS_INCLUDED

#include "StringUtils.mqh"

class CTimeFrameUtils
{
  public:
    // Methods
    //- GET
    static ENUM_TIMEFRAMES GetTimeFrameByPlaceholder(string timeFrame, ENUM_TIMEFRAMES defaultTimeFrame);
};

/**
 * Retorna o tempo gráfico a partir de uma string
 */
ENUM_TIMEFRAMES CTimeFrameUtils::GetTimeFrameByPlaceholder(string timeFrame, ENUM_TIMEFRAMES defaultTimeFrame)
{
  string txt = CStringUtils::RemoveSpaces(timeFrame);
  if(txt == "CURRENT" || txt == "PERIOD_CURRENT")
    {
      return (defaultTimeFrame);
    }
  else if(txt == "M1" || txt == "PERIOD_M1")
    {
      return (PERIOD_M1);
    }
  else if(txt == "M2" || txt == "PERIOD_M2")
    {
      return (PERIOD_M2);
    }
  else if(txt == "M3" || txt == "PERIOD_M3")
    {
      return (PERIOD_M3);
    }
  else if(txt == "M4" || txt == "PERIOD_M4")
    {
      return (PERIOD_M4);
    }
  else if(txt == "M5" || txt == "PERIOD_M5")
    {
      return (PERIOD_M5);
    }
  else if(txt == "M6" || txt == "PERIOD_M6")
    {
      return (PERIOD_M6);
    }
  else if(txt == "M10" || txt == "PERIOD_M10")
    {
      return (PERIOD_M10);
    }
  else if(txt == "M12" || txt == "PERIOD_M12")
    {
      return (PERIOD_M12);
    }
  else if(txt == "M15" || txt == "PERIOD_M15")
    {
      return (PERIOD_M15);
    }
  else if(txt == "M20" || txt == "PERIOD_M20")
    {
      return (PERIOD_M20);
    }
  else if(txt == "M30" || txt == "PERIOD_M30")
    {
      return (PERIOD_M30);
    }
  else if(txt == "H1" || txt == "PERIOD_H1")
    {
      return (PERIOD_H1);
    }
  else if(txt == "H2" || txt == "PERIOD_H2")
    {
      return (PERIOD_H2);
    }
  else if(txt == "H3" || txt == "PERIOD_H3")
    {
      return (PERIOD_H3);
    }
  else if(txt == "H4" || txt == "PERIOD_H4")
    {
      return (PERIOD_H4);
    }
  else if(txt == "H6" || txt == "PERIOD_H6")
    {
      return (PERIOD_H6);
    }
  else if(txt == "H8" || txt == "PERIOD_H8")
    {
      return (PERIOD_H8);
    }
  else if(txt == "H12" || txt == "PERIOD_H12")
    {
      return (PERIOD_H12);
    }
  else if(txt == "D1" || txt == "PERIOD_D1")
    {
      return (PERIOD_D1);
    }
  else if(txt == "W1" || txt == "PERIOD_W1")
    {
      return (PERIOD_W1);
    }
  else if(txt == "MN1" || txt == "PERIOD_MN1")
    {
      return (PERIOD_MN1);
    }
  return (-1);
}

#endif /* TIMEFRAMEUTILS_INCLUDED */
