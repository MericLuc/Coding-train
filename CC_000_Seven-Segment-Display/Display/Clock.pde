class Clock
{
  /*!
   * The 6 seven-segment display
   * (XX:XX:XX) that contains the clock.
   */
  SevenSegment[] clock_digit;
  
  /*!
   * The current seconds
   */
  int current_sec;
  
  /*!
   * The current minuts
   */
  int current_min;
  
  /*!
   * The current hours
   */
  int current_hour;
  
  /*!
   * The position of the clock
   */
   int clock_x, clock_y;
   
  /*!
   * The color of the digits
   */
   color digit_color;
   
  /*!
   * The geometry of the digits
   */
   int digit_width, digit_height, digit_space;
   
   Clock(int p_clock_x,
         int p_clock_y,
         int p_digit_color,
         int p_digit_width,
         int p_digit_height,
         int p_digit_space)
         {           
           clock_x = p_clock_x;
           clock_y = p_clock_y;
           
           digit_color = p_digit_color;
           digit_width = abs(p_digit_width);
           digit_height = abs(p_digit_height);
           digit_space = abs(p_digit_space);
           
           clock_digit = new SevenSegment[6];
           
           // Position of each digit
           int x = clock_x;
           int y = clock_y;
           
           for(int i=0; i<6; ++i)
           {
             clock_digit[i] = new SevenSegment(digit_color, x, y, digit_width, digit_height, digit_space);
             
             // Update position for the next digit (only x changes since the clock is... uh... horizontal)
             if( (i == 1) || (i == 3) )
             {
               x += digit_width + 2*(digit_height + digit_space) + 70;
             }
             else
             {
               x += digit_width + 2*(digit_height + digit_space) + 40;
             }
           }
           
         }
  
  /*!
   * Get the current time.
   */
  void updateTime()
  {
    current_sec = second();
    current_min = minute();
    current_hour = hour();
    
    // X_:__:__
    clock_digit[0].digit(current_hour / 10);
    
    // _X:__:__
    clock_digit[1].digit(current_hour % 10);
   
    // __:X_:__
    clock_digit[2].digit(current_min / 10);
    
    // __:_X:__
    clock_digit[3].digit(current_min % 10);
    
    // __:__:X_
    clock_digit[4].digit(current_sec / 10);
    
    // __:__:_X
    clock_digit[5].digit(current_sec % 10);
  }
  
  /*!
   * Displays current time.
   */
  void show()
  {
    background(0);
    smooth();
    stroke(255);
    
    for(int i=0; i<6; ++i)
    {
      clock_digit[i].show();
    }
  }
  
}
