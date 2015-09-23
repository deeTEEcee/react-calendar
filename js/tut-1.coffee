{div, input, b, h1} = React.DOM

App = React.createClass({
  getInitialState: () ->
    {
      txt: ''
    }
  update: (e) ->
    @setState {txt: e.target.value}

  # getDefaultProps: () ->
    # {
      # txt: '',
      # cat: 0
    # }
  propTypes:
    txt: React.PropTypes.string,
    # cat: React.PropTypes.number.isRequired

  render: () ->
    (div {}, [
      React.createElement(Widget, {txt: @state.txt, update: @update})
    ])
})

Widget = React.createClass(
  render: () ->
    (div {}, [
     (input {onChange: @props.update}, '')
     (h1 {}, @props.txt)
    ])
)

React.render(React.createElement(App),
             document.body)



