# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "[ -f ~/.help ] && echo 'yes' || echo 'no'"

# the refresh frequency in milliseconds
refreshFrequency: 1000000

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
  <h1>Yabai cheat sheet</h1>
  <hr \>
  <table>
  <tr>
    <th>Action</th>
    <th>Command</th>
  </tr>
  <tr>
    <td>Move focus across windows</td>
    <td>CMD + [h|j|k|l] </td>
  </tr>
  <tr>
    <td>Move focus across spaces</td>
    <td>CMD + NUM </td>
  </tr>
  <tr>
    <td>Space focus: [recent, prev, next]</td>
    <td>Shift + CMD + [asd] </td>
  </tr>
  <tr>
    <td>Fullscreen</td>
    <td>ALT + F</td>
  </tr>
  <tr>
    <td>Send & follow</td>
    <td>ALT + Shift + NUM</td>
  </tr>
  <tr>
    <td>Increase Window Size</td>
    <td>ALT + [hjkl]</td>
  </tr>
  <tr>
    <td>Decreate Window Size</td>
    <td>Shift + ALT + [hjkl]</td>
  </tr>
</table>
"""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  background: rgba(#fff, 0.95)
  background-size: 176px 84px
  -webkit-backdrop-filter: blur(20px)
  border-radius: 1px
  border: 2px solid #fff
  box-sizing: border-box
  color: #141f33
  font-family: Helvetica Neue
  font-weight: 300
  left: 84%
  line-height: 1.5
  margin-left: -170px
  padding: 0px 10px 10px
  top: 10%
  width: 359px
  text-align: justify

  h1
    font-size: 20px
    font-weight: 900
    margin: 0px 0 8px
    text-align: center

  em
    font-weight: 400
    font-style: normal

  td
    text-align: left

  table
      tr:nth-child(even)
        background-color: #eee
      tr:nth-child(odd)
        background-color: #fff
"""
