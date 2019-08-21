#!/usr/bin/env bash

scaffold_test_base()               { setup_bundles base               }
scaffold_test_css()                { setup_bundles postcss stylelint  }
scaffold_test_git()                { setup_bundles git                }
scaffold_test_hyperapp()           { setup_bundles hyperapp           }
scaffold_test_js()                 { setup_bundles babel              }
scaffold_test_node()               { setup_bundles node               }
scaffold_test_purescript()         { setup_bundles purescript         }
scaffold_test_typescript()         { setup_bundles typescript tslint  }
scaffold_test_webpack()            { setup_bundles webpack            }
scaffold_test_webpack_purescript() { setup_bundles webpack purescript }
scaffold_test_webpack_typescript() { setup_bundles webpack typescript }
