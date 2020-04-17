const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#031414", /* black   */
  [1] = "#7DAAC1", /* red     */
  [2] = "#94A8B0", /* green   */
  [3] = "#97B7CA", /* yellow  */
  [4] = "#B1C7D8", /* blue    */
  [5] = "#B9CEE0", /* magenta */
  [6] = "#D0D6E1", /* cyan    */
  [7] = "#dfe3e9", /* white   */

  /* 8 bright colors */
  [8]  = "#9c9ea3",  /* black   */
  [9]  = "#7DAAC1",  /* red     */
  [10] = "#94A8B0", /* green   */
  [11] = "#97B7CA", /* yellow  */
  [12] = "#B1C7D8", /* blue    */
  [13] = "#B9CEE0", /* magenta */
  [14] = "#D0D6E1", /* cyan    */
  [15] = "#dfe3e9", /* white   */

  /* special colors */
  [256] = "#031414", /* background */
  [257] = "#dfe3e9", /* foreground */
  [258] = "#dfe3e9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
