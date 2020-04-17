const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#121516", /* black   */
  [1] = "#C58F6A", /* red     */
  [2] = "#4E7A85", /* green   */
  [3] = "#687F80", /* yellow  */
  [4] = "#61969F", /* blue    */
  [5] = "#559EAD", /* magenta */
  [6] = "#95A1A5", /* cyan    */
  [7] = "#cadde3", /* white   */

  /* 8 bright colors */
  [8]  = "#8d9a9e",  /* black   */
  [9]  = "#C58F6A",  /* red     */
  [10] = "#4E7A85", /* green   */
  [11] = "#687F80", /* yellow  */
  [12] = "#61969F", /* blue    */
  [13] = "#559EAD", /* magenta */
  [14] = "#95A1A5", /* cyan    */
  [15] = "#cadde3", /* white   */

  /* special colors */
  [256] = "#121516", /* background */
  [257] = "#cadde3", /* foreground */
  [258] = "#cadde3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
