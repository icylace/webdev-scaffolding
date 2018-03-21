/**
 * Based on:
 * https://github.com/hyperapp/hyperapp#getting-started

/*

import { app } from "hyperapp"

import { actions, state, view } from "./component/app/app"

// tslint:disable:no-expression-statement
app(state, actions, view, document.body)

*/

/**
 * Based on:
 * https://github.com/hyperapp/hyperapp#getting-started
 */

import { app, h, View } from "hyperapp"

type State = { readonly count: number }
const state: State = {
  count: 0,
}

type Actions = { readonly [key: string]: (id: number) => (state: State) => State }
const actions: Actions = {
  down: (value: number) => (state: State) => ({ count: state.count - value }),
  up: (value: number) => (state: State) => ({ count: state.count + value }),
}

const view: View<State, Actions> = (state: State, actions: Actions) =>
  h("main", {}, [
    h("h1", {}, state.count),
    h("button", { onclick: () => actions.down(1), disabled: state.count <= 0 }, "ー"),
    h("button", { onclick: () => actions.up(1) }, "＋"),
  ])

// tslint:disable:no-expression-statement
app(state, actions, view, document.body)

/*

import { app, h } from "hyperapp"

const squareCount = 9

type state = {
  readonly history: ReadonlyArray<{ readonly squares: ReadonlyArray<string> }>
  readonly stepNumber: number
  readonly xIsNext: boolean
}
const state: state = {
  history: [{ squares: Array(squareCount).fill(null) }],
  stepNumber: 0,
  xIsNext: true,
}

type actions = { readonly [key: string]: (id: number) => (state: state) => state }
const actions: actions = {
  tick: id => state => {
    const history = state.history.slice(0, state.stepNumber + 1)
    const current = history[history.length - 1]
    const squares = current.squares.slice()
    return !current.squares[id] && !calculateWinner(current.squares)
      ? {
          history: history.concat([
            {
              squares: squares.map(
                (item: string, itemId: number) => (itemId === id ? (state.xIsNext ? "X" : "O") : item),
              ),
            },
          ]),
          stepNumber: history.length,
          xIsNext: !state.xIsNext,
        }
      : false
  },
  jumpTo: step => _state => ({
    history,
    stepNumber: step,
    xIsNext: step % 2 === 0,
  }),
}

type square = (a: any) => any
const square: square = ({ value, index, tick }) => h("button", { onclick: () => tick(index), class: "square" }, value)

type board = (a: any) => any
const board: board = ({ squares, tick }) =>
  h("div", {}, [
    h("div", { class: "board-row" }, [
      square({ value: squares[0], index: 0, tick }),
      square({ value: squares[1], index: 1, tick }),
      square({ value: squares[2], index: 2, tick }),
    ]),
    // tslint:disable:no-magic-numbers
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
    // tslint:enable:no-magic-numbers
  ])

type view = (state: state, actions: actions) => any
const view: view = (state, actions) => {
  const current = state.history[state.stepNumber]
  const winner = calculateWinner(current.squares)
  const status = winner ? `Winner: ${winner}` : `Next player: ${state.xIsNext ? "X" : "O"}`
  const moves = state.history.map((_step, move: number) => {
    const desc = move ? `Go to move #${move}` : "Go to game start"
    return h("li", [h("button", { onclick: () => actions.jumpTo(move) }, desc)])
  })
  return h("div", { class: "game" }, [
    h("div", { class: "game-board" }, [board({ squares: current.squares, tick: actions.tick })]),
    h("div", { class: "game-info" }, [h("div", [status]), h("ol", [moves])]),
  ])
}

type calculateWinner = (squares: ReadonlyArray<string>) => any
const calculateWinner: calculateWinner = squares => {
  // prettier-ignore
  // tslint:disable:no-magic-numbers
  const lines: ReadonlyArray<ReadonlyArray<number>> = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  // tslint:enable:no-magic-numbers

  return lines.find(([a, b, c]) => {
    return squares[a] && squares[a] === squares[b] && squares[a] === squares[c] ? squares[a] : undefined
  })

  // for (let i = 0; i < lines.length; i++) {
  //   const [a, b, c] = lines[i]
  //   if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
  //     return squares[a]
  //   }
  // }
  // return null
}

// tslint:disable:no-expression-statement
app(state, actions, view, document.body)

// "transition",
// "transition-delay",
// "transition-duration",
// "transition-property",
// "transition-timing-function",

/*
import { h, app } from "hyperapp"
import { withFx, http, action } from "@hyperapp/fx"

const state = {
  quote: "Click here for quotes"
}

const actions = {
  getQuote: () => [
    action("setQuote", "..."),
    http(
      "https://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1",
      "quoteFetched"
    )
  ],
  quoteFetched: ([{ content }]) => action("setQuote", content),
  setQuote: quote => ({ quote })
}

const view = state => <h1 onclick={action("getQuote")}>{state.quote}</h1>

withFx(app)(state, actions, view, document.body)
*/
