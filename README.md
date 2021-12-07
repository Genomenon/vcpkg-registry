Genomenon vcpkg registry
========================

This is a [vcpkg](https://vcpkg.io/) registry for locally-defined
packages.

## loguru-fmt

This is a fork of the package for
[loguru](https://github.com/emilk/loguru) with fmtlib and a few other
options enabled. Because using fmtlib is incompatible with the default
behavior, it can't be added as a feature to the standard loguru
package.

In particular, it sets:

``` cmake
LOGURU_USE_FMTLIB=1
LOGURU_STACKTRACES=0
LOGURU_THREADNAME_WIDTH=8
LOGURU_WITH_STREAMS=1
LOGURU_VERBOSE_SCOPE_ENDINGS=1
LOGURU_SCOPE_TIME_PRECISION=6
```
