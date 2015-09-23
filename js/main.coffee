## Constants / Setup
{div, table, tr, td, hr} = React.DOM

## Main Classes
Calendar = React.createClass({
  getInitialState: () ->
    {
      type: "day"
      step: 1
      cells_per_block: 3
    }

  render: () ->
    (div {}, [
      React.createElement(FullDisplay)
    ])
})

FullDisplay = React.createClass({
  getInitialState: () ->
    {
      type: "day"
      step: 1
      cells_per_block: 3
    }
  render: () ->
    blocks = []
    for hour in [0..23]
      if hour < 10
        output = "0#{hour}:00"
      else
        output = "#{hour}:00"

      blocks.push(React.createElement(Block, {output: output}))
    (div {},
      table {},
        blocks
    )
})

Block = React.createClass(
  getDefaultProps: () ->
    {
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

  render: () ->
    console.log('test' + @getHorizontalLines())
    (tr { style: {height: "#{@props.height}px"}}, [
      td { className: 'times'}, @props.output
      td { className: 'events'}, {},
      @getHorizontalLines()
    ])
)

Event = React.createClass({
  getDefaultProps: () ->
    minutes = 60
    cellHeight = -1
  render: () ->
    (div {style: {
        top: minutes / cellHeight,
        height: minutes
      }},
      (dl {},
        (dt { className: 'small'}, 'text')
      )
    )
})

React.render(React.createElement(Calendar),
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
