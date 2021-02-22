const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#371a10", /* black   */
  [1] = "#5CA1AF", /* red     */
  [2] = "#73B8C5", /* green   */
  [3] = "#77C3CD", /* yellow  */
  [4] = "#9FB3B4", /* blue    */
  [5] = "#91BBC6", /* magenta */
  [6] = "#8FCAD2", /* cyan    */
  [7] = "#cfe1e3", /* white   */

  /* 8 bright colors */
  [8]  = "#909d9e",  /* black   */
  [9]  = "#5CA1AF",  /* red     */
  [10] = "#73B8C5", /* green   */
  [11] = "#77C3CD", /* yellow  */
  [12] = "#9FB3B4", /* blue    */
  [13] = "#91BBC6", /* magenta */
  [14] = "#8FCAD2", /* cyan    */
  [15] = "#cfe1e3", /* white   */

  /* special colors */
  [256] = "#371a10", /* background */
  [257] = "#cfe1e3", /* foreground */
  [258] = "#cfe1e3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
