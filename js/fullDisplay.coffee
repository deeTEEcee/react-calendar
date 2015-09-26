## Constants / Setup
{p, dl, dd, dt, div, table, tr, td, hr} = React.DOM
PIXELS_PER_MINUTE = 1
Block = require('./block')

FullDisplay = React.createClass({
  getDefaultProps: () ->
    {
      eventsByHour: null
    }
  eventsByHour: (hour) ->
    @props.eventsByHour[hour]
  render: () ->
    blocks = []
    for hour in [0..23]
      blocks.push(React.createElement(Block, {hour: hour, events: @eventsByHour(hour)}))
    (div {},
      table {},
        blocks
    )
})

module.exports = FullDisplay
