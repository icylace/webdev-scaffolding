// Based on:
// https://codepen.io/Daynox/pen/ZvKZzx

import { app } from "hyperapp"
import { button, div, li, ol } from "@hyperapp/html"

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
const square: square = ({ value, index, tick }) => button({ onclick: () => tick(index), class: "square" }, value)

type board = (a: any) => any
const board: board = ({ squares, tick }) =>
  div([
    div({ class: "board-row" }, [
      square({ index: 0, tick, value: squares[0] }),
      square({ index: 1, tick, value: squares[1] }),
      square({ index: 2, tick, value: squares[2] }),
    ]),
    div({ class: "board-row" }, [
      square({ index: 3, tick, value: squares[3] }),
      square({ index: 4, tick, value: squares[4] }),
      square({ index: 5, tick, value: squares[5] }),
    ]),
    div({ class: "board-row" }, [
      square({ index: 6, tick, value: squares[6] }),
      square({ index: 7, tick, value: squares[7] }),
      square({ index: 8, tick, value: squares[8] }),
    ]),
  ])

type view = (state: state, actions: actions) => any
const view: view = (state, actions) => {
  const current = state.history[state.stepNumber]
  const winner = calculateWinner(current.squares)
  const status = winner ? `Winner: ${winner}` : `Next player: ${state.xIsNext ? "X" : "O"}`
  const moves = state.history.map((_step: any, move: number) => {
    const desc = move ? "Go to move #" + move : "Go to game start"
    return li([button({ onclick: () => actions.jumpTo(move) }, desc)])
  })
  return div({ class: "game" }, [
    div({ class: "game-board" }, [board({ squares: current.squares, tick: actions.tick })]),
    div({ class: "game-info" }, [div([status]), ol([moves])]),
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
