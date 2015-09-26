## Constants / Setup
{p, dl, dd, dt, div, table, tr, td, hr} = React.DOM
PIXELS_PER_MINUTE = 1

Block = React.createClass(
  getDefaultProps: () ->
    {
      events: null,
      hour: null,
      cellsPerBlock: 3
      height: 60
    }
  cellHeight: () ->
    @props.height / @props.cellsPerBlock
  getHorizontalLines: () ->
    hrs = []
    for i in [1...@props.cellsPerBlock]
      hrs.push((hr {style: {top: "#{@cellHeight() * i}px"}}))
    hrs
  display: () ->
    moment({hours: @props.hour}).format("hh:mmA")
  render: () ->
    # console.log('test' + @getHorizontalLines())
    (tr { style: {height: "#{@props.height}px"}}, [
      td { className: 'times'}, @display()
      td { className: 'events'}, {},
      @getHorizontalLines(),
      @props.events
    ])
)

module.exports = Block
