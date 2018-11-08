# Ruby

## RVM

Note that RVM should be installed using the generic script installer and not via any OS package manager.

For example, the Ubuntu RVM package installs RVM in multi-user mode outside of the users home directory.
This leads to complexity around managing user group permissions ( via the `rvm` group ) and requires the usage
of `rvmsudo` for various features. E.g. I have been unable to get `rvm get stable` to work without prefixing it with
`rvmsudo`.
