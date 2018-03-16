/**
 * Test
 */

import { h } from "hyperapp"

type State = { readonly count: number }
const state: State = {
  count: 0,
}

type Actions = { readonly [key: string]: (value: number) => (state: State) => State }
const actions: Actions = {
  down: (value: number) => (state: State) => ({ count: state.count - value }),
  up: (value: number) => (state: State) => ({ count: state.count + value }),
}

const view = (state: State, actions: Actions) =>
  h("main", {}, [
    h("h1", {}, state.count),
    h("button", { onclick: () => actions.down(1), disabled: state.count <= 0 }, "ー"),
    h("button", { onclick: () => actions.up(1) }, "＋"),
  ])

export { state, actions, view }
