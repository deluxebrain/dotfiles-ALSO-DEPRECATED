# Bin files

## Overview

Files in the `bin` directory represent re-usable scripts intended to be executed from the command line or from other scripts.

They expect to be run in their own shell and should not be sourced from other scripts. As such they should include a `#!/bin/bash` header ( or equivalent ).

Due to the presence of the header, there is no need to suffix these file with an `sh` extension. In addition, leaving off this extension makes the files more convenient to run from the command line.
