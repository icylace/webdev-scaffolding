// Based on:
// https://stackoverflow.com/a/44228423

declare module "*.css" {
  interface ClassNames {
    [className: string]: string
  }
  const classNames: ClassNames
  export = classNames
}
