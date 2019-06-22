# longtable-sphinx.sed with -nE
v 4.4
s/^([^&]+)&([^&]+)&([^\]+)\\\\/   * - \1\n     - \2\n     - \3/p
s/\\underline\{([^}]+)\}\\\\/   * - **\1**\n     -\n     -/p


