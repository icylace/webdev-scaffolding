/**
 * Utilities for working with CSS Modules.
 *
 * Example usage:
 *
 * import * as componentCss from "./component.css"
 * const css = useClassesFrom(componentCss)
 *
 */

interface ClassNames {
  readonly [className: string]: string
}

// Let our linter know we're intentionally using `class` as an object key.
// tslint:disable-next-line:no-reserved-keywords
type UseClassesFrom = (cssModule: ClassNames) => (classes: ReadonlyArray<string>) => { readonly class: string }

const useClassesFrom: UseClassesFrom = cssModule => classes => ({
  class: classes.map((it: string) => cssModule[it]).join(" "),
})

export const styles = { useClassesFrom }
