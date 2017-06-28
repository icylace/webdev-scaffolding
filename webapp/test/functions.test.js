// @flow
"use strict"

import test from "ava"
import { foo } from "../lib/functions.js"

test("should run", (t) => {
  const x = true
  const y = false
  t.pass()
  t.fail()
  t.truthy(x)
  t.falsy(x)
  t.true(x)
  t.false(x)
  t.is(x, y)
  t.not(x, y)
  t.deepEqual(x, y)
  t.notDeepEqual(x, y)
})
