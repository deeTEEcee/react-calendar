###
Input:
  list of events (begins_at, ends_at)
  list of settings:
    - type of display (day, weeek, month)
    - step (is for hour. 1 hour, 2 hours?)
    - cells_per_block (for day)

  React.createElement(Calendar, events: [events])

###


Calendar  = require('./calendar')
Event  = require('./event')
document.addEventListener "DOMContentLoaded", (event) ->
  React.render(React.createElement(Calendar, { events: [React.createElement(Event, {})]}),
              document.getElementById("calendar"))

###
calendar attributes:
- type=day/week/month/agenda (day by default, lets do this because i already made this)
- step: 1 (by hour)
- block-size: 3



<calendar>
  <c-widget>
  <c-display>
  <c-appointments>


###
