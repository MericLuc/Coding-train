class Segment
{
  /*!
   * Color of the segment 
   */
  color s_color;
  
  /*!
   * Color of the element when it is OFF
   */
  color off_color;
  
  /*!
   * Geometry of the segment
   */
  int s_width, s_height;
  
  /*!
   * Position of the segment
   */
  int s_x, s_y;
  
  /*!
   * Defines if the element is ON or OFF
   */
   boolean s_display;
  
  /*!
   * Constructor
   */
  Segment(color p_color, 
          int   p_x, 
          int   p_y, 
          int   p_width, 
          int   p_height)
          {
            s_color = p_color;
            off_color = color(216, 216, 216, 20);
            s_x = p_x;
            s_y = p_y;
            
            s_width = abs(p_width);
            s_height = abs(p_height);
            
            s_display = false;
          }
          
  /*!
   * Switch to ON/OFF
   */
   void displayed(boolean p_display)
   {
     s_display = p_display;
   }
   
  /*!
   * Displays the element on the screen
   */
   void show()
   {
     color current_color = off_color;
     if(s_display)
     {
       current_color = s_color;
     }

    noStroke();
    fill(current_color);
    rect(s_x, 
         s_y, 
         s_width, 
         s_height,
         25,
         25,
         25,
         25);
   }
}

class SevenSegment
{
  /*!
   * Array of segments
   */
  Segment[] segments;
  
  /*!
   * Array containing the state of
   * each segments for each drawable digit.
   */
   boolean[][]  segments_states = {  {true, true, true, true, true, true, false},      // 0
                                     {false, true, true, false, false, false, false},  // 1
                                     {true, true, false, true, true, false, true},     // 2
                                     {true, true, true, true, false, false, true},     // 3
                                     {false, true, true, false, false, true, true},    // 4
                                     {true, false, true, true, false, true, true},     // 5
                                     {true, false, true, true, true, true, true},      // 6
                                     {true, true, true, false, false, false, false},   // 7
                                     {true, true, true, true, true, true, true},       // 8
                                     {true, true, true, false, false, true, true}      // 9
                                   };
  
  /*!
   * Size of each segments
   */
   int segments_width, segments_height;
   
  /*!
   * Space between each segments
   */
   int space;
   
  /*!
   * Current digit
   */
   int current_digit;
   
  /*!
   * Position of the segments
   */
   int segment_x, segment_y;

  /*!
   * Constructor
   */
  SevenSegment(color p_segmentsColor,
               int   p_segment_x,
               int   p_segment_y,
               int   p_segments_width,
               int   p_segments_height,
               int   p_space)
  {
    segments_width = abs(p_segments_width);
    segments_height = abs(p_segments_height);
    space = abs(p_space);
    current_digit = -1;
    segment_x = p_segment_x;
    segment_y = p_segment_y;
    
    // segments_states = new boolean[10][7];
    
    segments = new Segment[7];
    segments[0] = new Segment(p_segmentsColor, segment_x, segment_y, segments_width, segments_height);
    segments[1] = new Segment(p_segmentsColor, segment_x + segments_width + space, segment_y + segments_height + space, segments_height, segments_width);
    segments[2] = new Segment(p_segmentsColor, segment_x + segments_width + space, segment_y + 2*(segments_height + space) + segments_width, segments_height, segments_width);
    segments[3] = new Segment(p_segmentsColor, segment_x, segment_y + 2*(segments_width + 2*space + segments_height), segments_width, segments_height);
    segments[4] = new Segment(p_segmentsColor, segment_x -(segments_height + space), segment_y + 2*(segments_height + space) + segments_width, segments_height, segments_width);
    segments[5] = new Segment(p_segmentsColor, segment_x -(segments_height + space), segment_y + segments_height + space, segments_height, segments_width);
    segments[6] = new Segment(p_segmentsColor, segment_x, segment_y + segments_width + 2*space + segments_height, segments_width, segments_height);
  }
  
  void digit(int p_digit)
  {
    p_digit = abs(p_digit);
    
    if(p_digit > 9)
    {
      p_digit = 9;
    }
    current_digit = p_digit;
    
    for(int i=0; i<7; ++i)
    {
      segments[i].displayed(segments_states[p_digit][i]);
    }  
  }
  
  void show()
  {   
    for(int i=0; i<7; ++i)
    {
      segments[i].show();
    }
  }
  
  int nextDigit()
  {
    if(current_digit == 9)
    {
      return 0;
    }
    else
    {
      return current_digit+1;
    }
  }
  
}
