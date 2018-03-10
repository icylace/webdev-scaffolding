// Based on:
// https://codepen.io/Daynox/pen/ZvKZzx

import { app, h } from "hyperapp"

type state = {
  history: { squares: any[] }[]
  stepNumber: number
  xIsNext: boolean
}
const state: state = {
  history: [
    {
      squares: Array(9).fill(null),
    },
  ],
  stepNumber: 0,
  xIsNext: true,
}

type actions = { [key: string]: ((id: number) => (state: state) => any) }
const actions: actions = {
  tick: id => state => {
    const history = state.history.slice(0, state.stepNumber + 1)
    const current = history[history.length - 1]
    const squares = current.squares.slice()
    return (
      !current.squares[id] &&
      !calculateWinner(current.squares) && {
        history: history.concat([
          {
            squares: squares.map((item: any, itemId: any) => (itemId === id ? (state.xIsNext ? "X" : "O") : item)),
          },
        ]),
        stepNumber: history.length,
        xIsNext: !state.xIsNext,
      }
    )
  },
  jumpTo: step => _state => ({
    stepNumber: step,
    xIsNext: step % 2 === 0,
  }),
}

type square = (a: any) => any
const square: square = ({ value, index, tick }) => h("button", { onclick: () => tick(index), class: "square" }, value)

type board = (a: any) => any
const board: board = ({ squares, tick }) =>
  h("div", [
    h("div", { class: "board-row" }, [
      square({ value: squares[0], index: 0, tick }),
      square({ value: squares[1], index: 1, tick }),
      square({ value: squares[2], index: 2, tick }),
    ]),
    h("div", { class: "board-row" }, [
      square({ value: squares[3], index: 3, tick }),
      square({ value: squares[4], index: 4, tick }),
      square({ value: squares[5], index: 5, tick }),
    ]),
    h("div", { class: "board-row" }, [
      square({ value: squares[6], index: 6, tick }),
      square({ value: squares[7], index: 7, tick }),
      square({ value: squares[8], index: 8, tick }),
    ]),
  ])

type view = (state: state, actions: actions) => any
const view: view = (state, actions) => {
  const current = state.history[state.stepNumber]
  const winner = calculateWinner(current.squares)
  const status = winner ? `Winner: ${winner}` : `Next player: ${state.xIsNext ? "X" : "O"}`
  const moves = state.history.map((_step: any, move: number) => {
    const desc = move ? "Go to move #" + move : "Go to game start"
    return h("li", [h("button", { onclick: () => actions.jumpTo(move) }, desc)])
  })
  return h("div", { class: "game" }, [
    h("div", { class: "game-board" }, [board({ squares: current.squares, tick: actions.tick })]),
    h("div", { class: "game-info" }, [h("div", [status]), h("ol", [moves])]),
  ])
}

type calculateWinner = (squares: any[]) => any
const calculateWinner: calculateWinner = squares => {
  // prettier-ignore
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i]
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a]
    }
  }
  return null
}

app(state, actions, view, document.body)
