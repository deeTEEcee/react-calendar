## Constants / Setup
{p, dl, dd, dt, div, table, tr, td, hr} = React.DOM
PIXELS_PER_MINUTE = 1
FullDisplay = require('./fullDisplay')

Calendar = React.createClass({
  getInitialState: () ->
    {
      type: "day"
      step: 1
      cells_per_block: 3
    }
  getDefaultProps: () ->
    {
      events: []
    }
  events: () ->
    if @state.type == "day"
      _.groupBy @props.events,
        (event) ->
          event.props.beginsAt.hours()
    else if @state.type == "month"
      null
  render: () ->
    (div {}, [
      React.createElement(FullDisplay, { eventsByHour: @events() })
    ])
})

module.exports = Calendar
