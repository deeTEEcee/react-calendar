## Constants / Setup
{p, dl, dd, dt, div, table, tr, td, hr} = React.DOM
PIXELS_PER_MINUTE = 1

Event = React.createClass({
  getDefaultProps: () ->
    {
      beginsAt: moment({hours: 13})
      endsAt: moment({hours: 14})
      cellHeight: 20
    }
  minutes: () ->
    @props.endsAt.diff(@props.beginsAt, 'minutes')
  render: () ->
    (div {className: 'event-by-hour', style: {
            top: @props.beginsAt.minutes() * PIXELS_PER_MINUTE,
            height: @minutes() * PIXELS_PER_MINUTE
          }},
          (dl {},
            (dt {}, "#{@props.beginsAt.format("hh:mmA")} ~ #{@props.endsAt.format("hh:mmA")}")
          )
    )
})

module.exports = Event
